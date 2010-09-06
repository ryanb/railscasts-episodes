require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Review.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Review.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to reviews_url
  end
end
