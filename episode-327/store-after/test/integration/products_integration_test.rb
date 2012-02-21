require "minitest_helper"

describe "Products integration" do
  it "shows product's name" do
    product = Product.create!(name: "Tofu")
    visit product_path(product)
    page.text.must_include "Tofu"
  end
end
