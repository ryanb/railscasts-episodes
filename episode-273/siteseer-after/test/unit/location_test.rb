require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Location.new.valid?
  end
end
