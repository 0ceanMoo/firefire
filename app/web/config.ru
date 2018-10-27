require 'rack'
require 'rack/session/redis'

use Rack::Session::Redis, {
  :redis_server => "redis://localhost:6380/1",
  :namespace    => "rack:session",
  :expire_after => 60 * 60 * 24,
}

require 'omniauth'
require 'omniauth-facebook'
require 'omniauth-twitter'
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

root = ::File.dirname(__FILE__)
require ::File.join(root, 'controller')
require ::File.join("#{root}/controllers", 'root')
require ::File.join("#{root}/controllers", 'members')

map('/') { run Root }
map('/members') { run Members }
