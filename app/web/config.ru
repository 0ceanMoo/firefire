root = ::File.dirname(__FILE__)
require ::File.join(root, 'app')
require ::File.join("#{root}/controllers", 'members')

map('/') { run App }
map('/members') { run Members }
