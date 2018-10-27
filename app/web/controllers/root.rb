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

    begin
      @member = Model::Member.find_or_create_oauth(@auth)
      login(@member)
      redirect "/"
    rescue => e
      redirect "/"
      #@errors = e
      #slim :auth
    end

  end

  get "/auth/failure" do
  end

end
