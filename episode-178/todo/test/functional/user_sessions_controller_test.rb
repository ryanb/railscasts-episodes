require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    post :create, :user_session => { :username => "foo", :password => "badpassword" }
    assert_template 'new'
    assert_nil UserSession.find
  end
  
  def test_create_valid
    post :create, :user_session => { :username => "foo", :password => "secret" }
    assert_redirected_to root_url
    assert_equal users(:foo), UserSession.find.user
  end
end
