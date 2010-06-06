require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Order.new.valid?
  end
end
