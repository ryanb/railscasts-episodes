require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author" do
    assert_difference('Author.count') do
      post :create, :author => @author.attributes
    end

    assert_redirected_to author_path(assigns(:author))
  end

  test "should show author" do
    get :show, :id => @author.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @author.to_param
    assert_response :success
  end

  test "should update author" do
    put :update, :id => @author.to_param, :author => @author.attributes
    assert_redirected_to author_path(assigns(:author))
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete :destroy, :id => @author.to_param
    end

    assert_redirected_to authors_path
  end
end
