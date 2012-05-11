require "rubygems"
require "bundler/setup"
require 'goliath'
require 'em-synchrony/activerecord'
require 'grape'
require './app/apis/posts_api'
require './app/models/post'

class Application < Goliath::API

  def response(env)
    ::PostsAPI.call(env)
  end

end