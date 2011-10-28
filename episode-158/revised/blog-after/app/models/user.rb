class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username, :email, allow_blank: true
  validates_format_of :username, with: /^[-\w\._@]+$/i, allow_blank: true, message: "should only contain letters, numbers, or .-_@"
  validates_format_of :email, with: /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, on: :create
  validates_length_of :password, minimum: 4, allow_blank: true

  def self.authenticate(username, password)
    user = find_by_username(username)
    return user if user && user.authenticate(password)
  end

  def can_manage_article?(article)
    admin? || article.user == self
  end
end
