require 'test_helper'

class FaqsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Faq.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Faq.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Faq.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to faq_url(assigns(:faq))
  end
  
  def test_edit
    get :edit, :id => Faq.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Faq.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Faq.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Faq.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Faq.first
    assert_redirected_to faq_url(assigns(:faq))
  end
  
  def test_destroy
    faq = Faq.first
    delete :destroy, :id => faq
    assert_redirected_to faqs_url
    assert !Faq.exists?(faq.id)
  end
end
