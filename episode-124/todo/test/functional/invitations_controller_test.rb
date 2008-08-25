require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Invitation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Invitation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to invitations_url
  end
end
