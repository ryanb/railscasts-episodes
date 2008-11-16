require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Review.new.valid?
  end
end
