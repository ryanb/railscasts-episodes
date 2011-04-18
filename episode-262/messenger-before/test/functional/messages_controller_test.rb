require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Message.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Message.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Message.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to message_url(assigns(:message))
  end

  def test_edit
    get :edit, :id => Message.first
    assert_template 'edit'
  end

  def test_update_invalid
    Message.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Message.first
    assert_template 'edit'
  end

  def test_update_valid
    Message.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Message.first
    assert_redirected_to message_url(assigns(:message))
  end

  def test_destroy
    message = Message.first
    delete :destroy, :id => message
    assert_redirected_to messages_url
    assert !Message.exists?(message.id)
  end
end
