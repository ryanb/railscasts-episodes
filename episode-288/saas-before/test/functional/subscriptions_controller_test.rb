require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  setup do
    @subscription = subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscription" do
    assert_difference('Subscription.count') do
      post :create, subscription: @subscription.attributes
    end

    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should show subscription" do
    get :show, id: @subscription.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscription.to_param
    assert_response :success
  end

  test "should update subscription" do
    put :update, id: @subscription.to_param, subscription: @subscription.attributes
    assert_redirected_to subscription_path(assigns(:subscription))
  end

  test "should destroy subscription" do
    assert_difference('Subscription.count', -1) do
      delete :destroy, id: @subscription.to_param
    end

    assert_redirected_to subscriptions_path
  end
end
