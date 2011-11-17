class Product < ActiveRecord::Base
  belongs_to :category

  def self.search(keywords)
    products = order(:name)
    products = products.where("name like ?", "%#{keywords}%") if keywords.present?
    products
  end
end
