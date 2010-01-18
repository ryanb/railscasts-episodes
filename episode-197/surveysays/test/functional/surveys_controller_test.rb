require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Survey.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Survey.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Survey.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to survey_url(assigns(:survey))
  end
  
  def test_edit
    get :edit, :id => Survey.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Survey.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Survey.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Survey.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Survey.first
    assert_redirected_to survey_url(assigns(:survey))
  end
  
  def test_destroy
    survey = Survey.first
    delete :destroy, :id => survey
    assert_redirected_to surveys_url
    assert !Survey.exists?(survey.id)
  end
end
