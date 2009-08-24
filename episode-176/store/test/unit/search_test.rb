require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Search.new.valid?
  end
end
