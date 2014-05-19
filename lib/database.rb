require 'erb'

# Connect to the database
# ERB needed because of Heroku: http://stackoverflow.com/a/18139387
def connect_to_db
  db_config = YAML.load(ERB.new(File.read('config/database.yml')).result)
  ActiveRecord::Base.establish_connection(db_config['production'])
end

connect_to_db
