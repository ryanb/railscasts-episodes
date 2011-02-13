require 'test_helper'

class PaintingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Painting.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Painting.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Painting.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to painting_url(assigns(:painting))
  end

  def test_edit
    get :edit, :id => Painting.first
    assert_template 'edit'
  end

  def test_update_invalid
    Painting.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Painting.first
    assert_template 'edit'
  end

  def test_update_valid
    Painting.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Painting.first
    assert_redirected_to painting_url(assigns(:painting))
  end

  def test_destroy
    painting = Painting.first
    delete :destroy, :id => painting
    assert_redirected_to paintings_url
    assert !Painting.exists?(painting.id)
  end
end
