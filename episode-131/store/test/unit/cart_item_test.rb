require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CartItem.new.valid?
  end
end
