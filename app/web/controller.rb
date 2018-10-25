require 'sinatra/base'
require "sinatra/required_params"
require "sinatra/reloader"
require 'sinatra/partial'

require "slim"
require "sass"

require "./lib/model"

Slim::Engine.options[:pretty] = true if ENV["RACK_ENV"] == "development"
Slim::Engine.set_options :streaming => false

class App < Sinatra::Base
  helpers Sinatra::RequiredParams

  configure do
    register Sinatra::Partial
    set :partial_template_engine, :slim
    enable :partial_underscores
  end

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    'ファイルが存在しません'
  end
end

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
