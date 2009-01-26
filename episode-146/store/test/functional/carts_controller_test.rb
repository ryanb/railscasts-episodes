require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  def test_edit
    get :edit, :id => Cart.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Cart.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Cart.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Cart.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Cart.first
    assert_redirected_to carts_url
  end
end
