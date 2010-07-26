require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Product.new.valid?
  end
end
