class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true, :email_format => true
end
