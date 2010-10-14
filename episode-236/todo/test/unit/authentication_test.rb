require 'test_helper'

class AuthenticationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Authentication.new.valid?
  end
end
