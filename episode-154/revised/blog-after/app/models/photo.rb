class Photo < ActiveRecord::Base
  attr_accessible :filename, :name
  has_many :comments, as: :commentable
end
