require 'test_helper'

class MailingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Mailing.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Mailing.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Mailing.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to mailing_url(assigns(:mailing))
  end
  
  def test_edit
    get :edit, :id => Mailing.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Mailing.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Mailing.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Mailing.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Mailing.first
    assert_redirected_to mailing_url(assigns(:mailing))
  end
  
  def test_destroy
    mailing = Mailing.first
    delete :destroy, :id => mailing
    assert_redirected_to mailings_url
    assert !Mailing.exists?(mailing.id)
  end
end
