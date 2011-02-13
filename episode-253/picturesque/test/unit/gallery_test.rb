require 'test_helper'

class GalleryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Gallery.new.valid?
  end
end
