class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_at
  has_paper_trail
end
