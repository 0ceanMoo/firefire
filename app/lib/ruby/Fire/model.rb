require 'active_record'
require "active_support/all"
require 'mysql2'
require 'email_validator'
#require "kaminari"

# DBの時間
Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

# DB設定のロードと接続
require "dotenv"
#conf  = YAML.load_file( "#{dir}/database.yml" )
Dotenv.load File.expand_path("../../../../.env", __dir__) # .envを読み込む
dir   = File.expand_path('../../../config', __dir__)
conf  = YAML::load(ERB.new(IO.read("#{dir}/database.yml")).result)
ActiveRecord::Base.establish_connection(conf["db"]["development"])

# modelsディレクトリ以下を読み込む
Dir[File.expand_path('./models', __dir__) << '/*.rb'].each do |file|
  require file
end

#require_relative './memcached'
#require_relative './models/member'
#require_relative './models/keyword'
#require_relative './models/user_keyword'
#require_relative './models/tweet'
#require_relative './models/tweet_keyword'
