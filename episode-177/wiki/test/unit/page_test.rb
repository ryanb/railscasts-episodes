require 'test_helper'

class PageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Page.new.valid?
  end
end
