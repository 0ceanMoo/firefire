root = ::File.dirname(__FILE__)
require ::File.join(root, 'controller')
require ::File.join("#{root}/controllers", 'root')
require ::File.join("#{root}/controllers", 'members')

map('/') { run Root }
map('/members') { run Members }
