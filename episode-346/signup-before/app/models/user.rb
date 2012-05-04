class User < ActiveRecord::Base
  attr_accessible :bio, :date_of_birth, :email, :github_username, :name, :password, :password_confirmation, :twitter_username, :website
  has_secure_password
end
