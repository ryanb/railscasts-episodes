class Product < ActiveRecord::Base
  belongs_to :category
  scope :unreleased, where(:released_at => nil)
end
