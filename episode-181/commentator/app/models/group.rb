class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  
  def comments
    Comment.scoped(:joins => {:user => :memberships}, :conditions => { :memberships => { :group_id => id } })
  end
end
