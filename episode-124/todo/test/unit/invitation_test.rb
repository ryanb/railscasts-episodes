require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Invitation.new.valid?
  end
end
