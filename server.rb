require 'rubygems'
require 'bundler/setup'

require 'goliath'
require 'em-synchrony'
require 'em-synchrony/activerecord'
require 'pg/em'
require 'grape'
require './app/apis/posts'
require './app/models/post'

class Application < Goliath::API

  def response(env)
    ::Posts.call(env)
  end

end
