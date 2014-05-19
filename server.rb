require 'goliath'
require 'em-synchrony/activerecord'
require 'grape'
require 'erb'

# replace with an load anything in app statement
require './app/apis/posts'
require './app/models/post'

# ERB needed because of Heroku: http://stackoverflow.com/a/18139387
db_config = YAML.load(ERB.new(File.read(File.join('config', 'database.yml'))).result)
ActiveRecord::Base.establish_connection(db_config)

class Application < Goliath::API

  def response(env)
    ::Posts.call(env)
  end

end
