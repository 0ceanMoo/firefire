class Root < App
  get "/" do
    @num = Model::Member.count
    @message = flash[:message]
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
    flash[:message] = "ログアウトしました"
    redirect "/"
  end

  get "/auth/:provider/callback" do
    # 認証情報は request.env に格納されている
    @auth = request.env["omniauth.auth"]
    #p "// ==== Login "
    #p @auth
    #p "provider\t#{@auth.provider}"
    #p "uid\t#{@auth.uid}"
    #p "email\t#{@auth.info.email}"
    #p "name\t#{@auth.info.name}"
    #p "nickname\t#{@auth.info.nickname}"
    #p "first_name\t#{@auth.info.first_name}"
    #p "last_name\t#{@auth.info.last_name}"
    #p "token\t#{@auth.credentials.token}"
    #p "secret\t#{@auth.credentials.secret}"
    #p "expires\t#{@auth.credentials.expires}"
    #p "expires_at\t#{@auth.credentials.expires_at}"
    begin
      @member = Model::Member.from_omniauth(@auth)
      login(@member)

      flash[:message] = "ログインしました"
      redirect "/"
    rescue => e
      p e
      #redirect "/"
      #@errors = e
      #slim :auth
    end

  end

  get "/auth/failure" do
  end

end
