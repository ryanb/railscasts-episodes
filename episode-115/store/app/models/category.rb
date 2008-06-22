class Category < ActiveRecord::Base
  has_many :products
  
  def self.all_cached
    Rails.cache.fetch('Category.all') { all }
  end
end
