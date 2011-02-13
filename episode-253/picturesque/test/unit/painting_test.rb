require 'test_helper'

class PaintingTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Painting.new.valid?
  end
end
