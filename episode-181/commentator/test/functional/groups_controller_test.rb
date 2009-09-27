require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Group.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Group.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Group.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to group_url(assigns(:group))
  end
  
  def test_edit
    get :edit, :id => Group.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Group.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Group.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Group.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Group.first
    assert_redirected_to group_url(assigns(:group))
  end
  
  def test_destroy
    group = Group.first
    delete :destroy, :id => group
    assert_redirected_to groups_url
    assert !Group.exists?(group.id)
  end
end
