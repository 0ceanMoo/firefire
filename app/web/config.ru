require 'rack'
require 'rack/session/redis'
require 'rack/flash'

use Rack::Session::Redis, {
  :redis_server => "redis://localhost:6380/1",
  :namespace    => "rack:session",
  :expire_after => 60 * 60 * 24,
}

# OAuthの設定
require 'omniauth'
require "omniauth-oauth2"
require 'omniauth-facebook'
require 'omniauth-twitter'
require 'omniauth-line'
require 'omniauth-google-oauth2'

require "dotenv"
require 'yaml'
require 'erb'

# OAuthのアプリIDやシークレットを読み込む
Dotenv.load File.expand_path("../../.env", __dir__) # .envを読み込む
dir   = File.expand_path('../config', __dir__)      # ymlファイルのディレクトリ
oauth = YAML::load(ERB.new(IO.read("#{dir}/oauth.yml")).result)

# OAuthを利用する設定
["line", "twitter", "facebook", "google_oauth2"].each do |provider|
  use OmniAuth::Builder do
    provider provider.to_sym,
      oauth[provider]["key"],
      oauth[provider]["secret"]
  end
end

# controller以下のファイルを読み込む
require ::File.join(__dir__, 'controller')
Dir[File.expand_path('./controllers', __dir__) << '/*.rb'].each do |file|
  require file
end

# ルーティング
map('/') { run Root }
map('/members') { run Members }
