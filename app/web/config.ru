require 'rack'
require 'rack/session/redis'

use Rack::Session::Redis, {
  :redis_server => "redis://localhost:6380/1",
  :namespace    => "rack:session",
  :expire_after => 60 * 60 * 24,
}

root = ::File.dirname(__FILE__)
require ::File.join(root, 'controller')
require ::File.join("#{root}/controllers", 'root')
require ::File.join("#{root}/controllers", 'members')

map('/') { run Root }
map('/members') { run Members }
