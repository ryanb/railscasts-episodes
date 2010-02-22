require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, :article => articles(:one).attributes
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, :id => articles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => articles(:one).to_param
    assert_response :success
  end

  test "should update article" do
    put :update, :id => articles(:one).to_param, :article => articles(:one).attributes
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, :id => articles(:one).to_param
    end

    assert_redirected_to articles_path
  end
end
