class Root < App
  get "/" do
    @title = "slim"
    slim :index
  end

  get '/search' do
    required_params :keywords
    params[:keywords]
  end
end
