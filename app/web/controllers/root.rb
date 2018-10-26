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

end
