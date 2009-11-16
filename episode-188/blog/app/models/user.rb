class User < ActiveRecord::Base
  acts_as_authentic
  has_many :articles
  has_many :comments
  has_many :assignments
  has_many :roles, :through => :assignments
  
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
end
