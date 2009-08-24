class Search < ActiveRecord::Base
  def products
    @products ||= find_products
  end
  
  private

  def find_products
    search = Product.search
    search.name_like(keywords) unless keywords.blank?
    search.price_gte(minimum_price) unless minimum_price.blank?
    search.price_lte(maximum_price) unless maximum_price.blank?
    search.category_id_equals(category_id) unless category_id.blank?
    search.all
  end
end
