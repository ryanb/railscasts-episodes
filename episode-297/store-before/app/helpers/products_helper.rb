module ProductsHelper
  def product_for_mustache(product)
    {
      id: product.id,
      url: product_url(product),
      name: product.name,
      price: number_to_currency(product.price),
      released_at: product.released_at.try(:strftime, "%B %e, %Y")
    }
  end
end
