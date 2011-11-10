class Product < ActiveRecord::Base
  belongs_to :category
  
  def category_name
    category.try(:name)
  end
  
  def category_name=(name)
    self.category = Category.find_or_create_by_name(name) if name.present?
  end
end
