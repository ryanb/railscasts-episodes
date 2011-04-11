require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Order.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Order.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to orders_url
  end

  def test_edit
    get :edit, :id => Order.first
    assert_template 'edit'
  end

  def test_update_invalid
    Order.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Order.first
    assert_template 'edit'
  end

  def test_update_valid
    Order.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Order.first
    assert_redirected_to orders_url
  end

  def test_destroy
    order = Order.first
    delete :destroy, :id => order
    assert_redirected_to orders_url
    assert !Order.exists?(order.id)
  end
end
