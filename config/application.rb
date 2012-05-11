require 'uri'
require 'em-synchrony/activerecord'
require 'yaml'
require 'erb'

# Sets up database configuration
db = URI.parse(ENV['DATABASE_URL'] || 'http://localhost')
if db.scheme == 'postgres' # Heroku environment
  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'em_postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
else # local environment
  environment = ENV['DATABASE_URL'] ? 'production' : 'development'
  db = YAML.load(ERB.new(File.read('config/database.yml')).result)[environment]
  ActiveRecord::Base.establish_connection(db)
end

