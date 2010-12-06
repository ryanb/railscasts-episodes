require 'test_helper'

class CityTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert City.new.valid?
  end
end
