require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert LineItem.new.valid?
  end
end
