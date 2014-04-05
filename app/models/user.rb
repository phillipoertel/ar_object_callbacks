class User < ActiveRecord::Base

  after_create UserCallbacks.new

end
