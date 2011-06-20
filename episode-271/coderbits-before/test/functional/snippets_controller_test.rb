require 'test_helper'

class SnippetsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Snippet.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Snippet.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to snippet_url(assigns(:snippet))
  end

  def test_show
    get :show, :id => Snippet.first
    assert_template 'show'
  end
end
