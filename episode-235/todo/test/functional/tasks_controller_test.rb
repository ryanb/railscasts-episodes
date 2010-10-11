require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Task.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Task.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end
  
  def test_edit
    get :edit, :id => Task.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Task.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Task.first
    assert_template 'edit'
  end

  def test_update_valid
    Task.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Task.first
    assert_redirected_to root_url
  end
  
  def test_destroy
    task = Task.first
    delete :destroy, :id => task
    assert_redirected_to root_url
    assert !Task.exists?(task.id)
  end
end
