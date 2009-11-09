require 'test_helper'

class ExceptionsTest < ActionController::IntegrationTest
  fixtures :all

  test "POST /products" do
    post "/products", "commit"=>"Submit", "product"=>{"name"=>"Headphones", "price"=>"-2"}
    assert_response :success
  end
  
  test "GET /products/8/edit" do
    product = Product.first
    get "/products/#{product.id}/edit"
    assert_response :success
  end
end
