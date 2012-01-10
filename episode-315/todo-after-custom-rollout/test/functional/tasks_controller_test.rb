require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: @task.attributes
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task.to_param
    assert_response :success
  end

  test "should update task" do
    put :update, id: @task.to_param, task: @task.attributes
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task.to_param
    end

    assert_redirected_to tasks_path
  end
end
