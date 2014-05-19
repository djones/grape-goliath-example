require 'goliath'
require 'em-synchrony/activerecord'
require 'grape'
require 'erb'

# Load in any app files you might add
Dir['./app/**/*.rb'].each { |file| require file }

# Connect to the database
# ERB needed because of Heroku: http://stackoverflow.com/a/18139387
db_config = YAML.load(ERB.new(File.read(File.join('config', 'database.yml'))).result)
ActiveRecord::Base.establish_connection(db_config['production'])

class Application < Goliath::API

  def response(env)
    Posts.call(env)
  end

end
