require './config/environment.rb'

class Application < Goliath::API

  def response(env)
    Posts.call(env)
  end

end
