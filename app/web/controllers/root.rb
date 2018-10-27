class Root < App
  get "/" do
    @num = 10
    slim :index
  end

  get '/login' do
    slim :login
  end

  post '/login' do
    required_params :email, :password
    @email = params[:email]
    if member = auth(@email, params[:password])
      login(member)
      redirect "/"
    else
      @error = "ログインに失敗しました。"
      slim :login
    end
  end

  get '/logout' do
    logout
    redirect "/"
  end

  get "/auth/:provider/callback" do
    # 認証情報は request.env に格納されている
    @auth = request.env["omniauth.auth"]
    #p "// ==== Login "
    #p "provider\t#{@auth.provider}"
    #p "uid\t#{@auth.uid}"
    #p "email\t#{@auth.info.email}"
    #p "name\t#{@auth.info.name}"
    #p "nickname\t#{@auth.info.nickname}"
    #p "first_name\t#{@auth.info.first_name}"
    #p "last_name\t#{@auth.info.last_name}"
    #p "credentials\t#{@auth.credentials}"

    @member = Model::Member.find_by(
      provider: @auth.provider,
      uid: @auth.uid,
    )

    if @member
        login(@member)
        #redirect "/"
    else
      @member = Model::Member.new(
        provider: @auth.provider,
        uid: @auth.uid,
        name: @auth.info.name,
        token: @auth.credentials.token,
        secret: @auth.credentials.secret,
      )

      @member.email = @auth.info.email if @auth.info.email
      @member.sname = @auth.info.nickname if @auth.info.nickname

      if @member.save(context: :oauth)
        login(@member)
        #redirect "/"
      else
        p @member.errors
        slim :auth
      end

    end
  end

  get "/auth/failure" do
  end

end
