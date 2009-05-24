require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Friendship.new.valid?
  end
end
