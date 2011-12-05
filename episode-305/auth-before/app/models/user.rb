class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  validates_presence_of :password, on: :create
  validates_presence_of :email
  has_secure_password
end
