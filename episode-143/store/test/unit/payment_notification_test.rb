require 'test_helper'

class PaymentNotificationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PaymentNotification.new.valid?
  end
end
