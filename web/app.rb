require 'sinatra/base'
require "sinatra/required_params"
require "sinatra/reloader"

class App < Sinatra::Base
  helpers Sinatra::RequiredParams
  # 開発時のみreloader
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Hello sinatra"
  end

  get '/search' do
    required_params :keywords
    params[:keywords]
  end
end
