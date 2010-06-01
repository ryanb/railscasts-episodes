require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  should "be valid" do
    assert Task.new.valid?
  end
end
