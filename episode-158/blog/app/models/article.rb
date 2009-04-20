class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates_presence_of :name, :user_id
  acts_as_list
  
  def editable_by?(some_user)
    some_user.admin? || some_user == user
  end
end
