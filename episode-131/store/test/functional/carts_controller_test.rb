require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  def test_show
    get :show, :id => Cart.first
    assert_template 'show'
  end
end
