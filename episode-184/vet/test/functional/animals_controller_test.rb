require 'test_helper'

class AnimalsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Animal.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Animal.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Animal.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to animal_url(assigns(:animal))
  end
  
  def test_edit
    get :edit, :id => Animal.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Animal.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Animal.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Animal.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Animal.first
    assert_redirected_to animal_url(assigns(:animal))
  end
  
  def test_destroy
    animal = Animal.first
    delete :destroy, :id => animal
    assert_redirected_to animals_url
    assert !Animal.exists?(animal.id)
  end
end
