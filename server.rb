require 'goliath'
require 'em-synchrony/activerecord'
require 'grape'

# replace with an load anything in app statement
require './app/apis/posts'
require './app/models/post'

db_config = YAML::load_file('config/database.yml')['production']
ActiveRecord::Base.establish_connection(db_config)

class Application < Goliath::API

  def response(env)
    ::Posts.call(env)
  end

end
