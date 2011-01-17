require 'test_helper'

class PageRequestTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PageRequest.new.valid?
  end
end
