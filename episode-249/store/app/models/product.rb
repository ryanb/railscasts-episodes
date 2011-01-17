class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_at
  
  def self.search(search)
    if search
      ActiveSupport::Notifications.instrument("products.search", :search => search)
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
