class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :category_id, :released_at, :discontinued_at, :stock

  def self.search(query)
    where do
      (released_at <= Time.zone.now) &
      ((discontinued_at == nil) | (discontinued_at > Time.zone.now)) &
      (stock >= my{low_stock}) & (name =~ "%#{query}%")
    end
  end
  
  def self.low_stock
    2
  end
end
