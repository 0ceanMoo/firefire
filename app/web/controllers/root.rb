class Root < App
  get "/" do
    @num = 10
    slim :index
  end

  get '/login' do
    equired_params login: [:id, :pw]
  end

end
