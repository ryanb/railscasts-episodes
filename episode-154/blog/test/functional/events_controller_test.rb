require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Event.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Event.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Event.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to event_url(assigns(:event))
  end
  
  def test_edit
    get :edit, :id => Event.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Event.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Event.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Event.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Event.first
    assert_redirected_to event_url(assigns(:event))
  end
  
  def test_destroy
    event = Event.first
    delete :destroy, :id => event
    assert_redirected_to events_url
    assert !Event.exists?(event.id)
  end
end
