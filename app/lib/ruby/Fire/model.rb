require 'active_record'
require "active_support/all"
require 'mysql2'
require 'email_validator'
#require "kaminari"

Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

dir   = File.expand_path('../../../env', __dir__)
conf  = YAML.load_file( "#{dir}/database.yml" )
ActiveRecord::Base.establish_connection(conf["db"]["development"])

Dir[File.expand_path('./models', __dir__) << '/*.rb'].each do |file|
  require file
end

#require_relative './memcached'
#require_relative './models/member'
#require_relative './models/keyword'
#require_relative './models/user_keyword'
#require_relative './models/tweet'
#require_relative './models/tweet_keyword'
