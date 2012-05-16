class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :released_on, :category, :category_id

  def released_on # quick hack to get the view working
    released_at.to_date
  end
end
