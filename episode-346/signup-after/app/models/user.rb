class User < ActiveRecord::Base
  attr_accessible :bio, :date_of_birth, :email, :github_username, :name, :password, :password_confirmation, :twitter_username, :website
  has_secure_password
  
  validates_format_of :twitter_username, without: /\W/, allow_blank: true
  # validates_presence_of :twitter_username, if: :on_social_step?
end
