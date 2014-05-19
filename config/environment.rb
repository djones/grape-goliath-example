require 'goliath'
require 'em-synchrony/activerecord'
require 'grape'

# Load required files
['app', 'lib'].each do |path|
  Dir["./#{path}/**/*.rb"].each { |file| require file }
end
