require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Cart.new.valid?
  end
end
