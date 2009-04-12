class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates_presence_of :name
  acts_as_list
end
