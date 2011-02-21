class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_at
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
