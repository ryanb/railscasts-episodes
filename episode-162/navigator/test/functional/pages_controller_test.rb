require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Page.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Page.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Page.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to page_url(assigns(:page))
  end
  
  def test_edit
    get :edit, :id => Page.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Page.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Page.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Page.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Page.first
    assert_redirected_to page_url(assigns(:page))
  end
  
  def test_destroy
    page = Page.first
    delete :destroy, :id => page
    assert_redirected_to pages_url
    assert !Page.exists?(page.id)
  end
end
