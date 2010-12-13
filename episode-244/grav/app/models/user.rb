class User < ActiveRecord::Base
  attr_accessible :email, :avatar_url
end
