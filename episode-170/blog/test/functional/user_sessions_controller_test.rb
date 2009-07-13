require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    UserSession.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    UserSession.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_sessions_url
  end
  
  def test_destroy
    user_session = UserSession.first
    delete :destroy, :id => user_session
    assert_redirected_to user_sessions_url
    assert !UserSession.exists?(user_session.id)
  end
end
