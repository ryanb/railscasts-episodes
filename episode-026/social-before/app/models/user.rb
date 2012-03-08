class User < ActiveRecord::Base
  has_many :projects
end
