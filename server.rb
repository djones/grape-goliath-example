require 'goliath'
require 'em-synchrony/activerecord'
require 'grape'

# replace with an load anything in app statement
require './app/apis/posts'
require './app/models/post'

ActiveRecord::Base.establish_connection(YAML::load_file('config/database.yml'))

class Application < Goliath::API

  def response(env)
    ::Posts.call(env)
  end

end
