require 'test_helper'

class GalleriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Gallery.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Gallery.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Gallery.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to gallery_url(assigns(:gallery))
  end

  def test_edit
    get :edit, :id => Gallery.first
    assert_template 'edit'
  end

  def test_update_invalid
    Gallery.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Gallery.first
    assert_template 'edit'
  end

  def test_update_valid
    Gallery.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Gallery.first
    assert_redirected_to gallery_url(assigns(:gallery))
  end

  def test_destroy
    gallery = Gallery.first
    delete :destroy, :id => gallery
    assert_redirected_to galleries_url
    assert !Gallery.exists?(gallery.id)
  end
end
