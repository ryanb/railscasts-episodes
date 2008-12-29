require 'test_helper'

class PaymentNotificationsControllerTest < ActionController::TestCase
  def test_create_invalid
    PaymentNotification.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    PaymentNotification.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to payment_notifications_url
  end
end
