require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Message.new.valid?
  end
end
