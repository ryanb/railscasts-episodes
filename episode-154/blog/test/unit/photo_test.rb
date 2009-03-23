require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Photo.new.valid?
  end
end
