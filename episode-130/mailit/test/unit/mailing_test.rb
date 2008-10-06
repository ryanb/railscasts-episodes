require 'test_helper'

class MailingTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Mailing.new.valid?
  end
end
