require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Task.new.valid?
  end
end
