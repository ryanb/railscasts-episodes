require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Problem.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Problem.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Problem.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to problem_url(assigns(:problem))
  end
  
  def test_edit
    get :edit, :id => Problem.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Problem.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Problem.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Problem.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Problem.first
    assert_redirected_to problem_url(assigns(:problem))
  end
  
  def test_destroy
    problem = Problem.first
    delete :destroy, :id => problem
    assert_redirected_to problems_url
    assert !Problem.exists?(problem.id)
  end
end
