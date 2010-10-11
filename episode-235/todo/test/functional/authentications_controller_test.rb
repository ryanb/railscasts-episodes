require 'test_helper'

class AuthenticationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_create_invalid
    Authentication.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Authentication.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to authentications_url
  end
  
  def test_destroy
    authentication = Authentication.first
    delete :destroy, :id => authentication
    assert_redirected_to authentications_url
    assert !Authentication.exists?(authentication.id)
  end
end
