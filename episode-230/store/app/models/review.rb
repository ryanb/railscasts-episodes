class Review < ActiveRecord::Base
  attr_accessible :content, :rating
  belongs_to :product
  scope :rating, proc { |rating| where(:rating => rating) }
end
