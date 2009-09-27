require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Membership.new.valid?
  end
end
