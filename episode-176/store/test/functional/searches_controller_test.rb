require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Search.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Search.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to search_url(assigns(:search))
  end
  
  def test_show
    get :show, :id => Search.first
    assert_template 'show'
  end
end
