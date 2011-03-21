require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Author.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Author.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Author.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to author_url(assigns(:author))
  end

  def test_edit
    get :edit, :id => Author.first
    assert_template 'edit'
  end

  def test_update_invalid
    Author.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Author.first
    assert_template 'edit'
  end

  def test_update_valid
    Author.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Author.first
    assert_redirected_to author_url(assigns(:author))
  end

  def test_destroy
    author = Author.first
    delete :destroy, :id => author
    assert_redirected_to authors_url
    assert !Author.exists?(author.id)
  end
end
