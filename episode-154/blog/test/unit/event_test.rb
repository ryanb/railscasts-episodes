require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Event.new.valid?
  end
end
