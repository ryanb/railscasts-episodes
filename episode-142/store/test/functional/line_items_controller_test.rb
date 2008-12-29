require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  def test_create_invalid
    LineItem.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    LineItem.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to line_items_url
  end
end
