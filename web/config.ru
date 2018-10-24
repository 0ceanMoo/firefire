root = ::File.dirname(__FILE__)
require ::File.join(root, 'app')
require ::File.join("#{root}/controllers", 'users')

map('/') { run App }
map('/users') { run Users }
