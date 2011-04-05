require 'test_helper'

class MessagesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Message.new.valid?
  end
end
