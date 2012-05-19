class Article < ActiveRecord::Base
  attr_accessible :content, :name
  has_many :comments, as: :commentable
end
