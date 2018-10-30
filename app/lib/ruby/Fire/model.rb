require 'active_record'
require "active_support/all"
require 'mysql2'
require 'email_validator'
#require "kaminari"

Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

dir   = File.expand_path('../../../conf', __dir__)
conf  = YAML.load_file( "#{dir}/Fire/database.yml" )
ActiveRecord::Base.establish_connection(config["db"]["development"])

#require_relative './memcached'
require_relative './models/member'
#require_relative './models/keyword'
#require_relative './models/user_keyword'
#require_relative './models/tweet'
#require_relative './models/tweet_keyword'
