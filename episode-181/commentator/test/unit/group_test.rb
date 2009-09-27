require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Group.new.valid?
  end
end
