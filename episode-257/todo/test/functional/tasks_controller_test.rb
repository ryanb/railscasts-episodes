require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_create_invalid
    Task.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Task.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tasks_url
  end
end
