class Product < ActiveRecord::Base
  belongs_to :category
  
  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
