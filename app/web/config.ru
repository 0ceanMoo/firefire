require 'rack'
require 'rack/session/redis'

use Rack::Session::Redis, {
  :redis_server => "redis://localhost:6380/1",
  :namespace    => "rack:session",
  :expire_after => 60 * 60 * 24,
}

require 'omniauth'
require "omniauth-oauth2"
require 'omniauth-facebook'
require 'omniauth-twitter'
require 'omniauth-line'
require 'omniauth-google-oauth2'

use OmniAuth::Builder do
  provider :twitter,
    'zPJa7tQdgNI4HVQXP2XZbXUqS',
    'pVtWKRqWNFa6L0aAaB461DFI8ZdUIlZc51KecK1nV18Jzj1U0T'
end

use OmniAuth::Builder do
  provider :facebook,
    "710056629350513",
    "f64833b199b494757ab8a1e021ccab0e"
end

use OmniAuth::Builder do
  provider :line,
    "1618045317",
    "1d66fc40c32e60519a8bfce5814c494f"
end

use OmniAuth::Builder do
  provider :google_oauth2,
    "583690777395-l3vnilk6vf71kqgamfjua9qqc49d7mp5.apps.googleusercontent.com",
    "TT4Su10RlXU1zxG_GYcjF_3v"
end

root = ::File.dirname(__FILE__)
require ::File.join(root, 'controller')
require ::File.join("#{root}/controllers", 'root')
require ::File.join("#{root}/controllers", 'members')

map('/') { run Root }
map('/members') { run Members }
