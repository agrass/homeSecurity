class User < ActiveRecord::Base
  attr_accessible :device_id, :email, :name
end
