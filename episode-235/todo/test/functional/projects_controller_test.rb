require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Project.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Project.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Project.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to project_url(assigns(:project))
  end
  
  def test_edit
    get :edit, :id => Project.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Project.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Project.first
    assert_template 'edit'
  end

  def test_update_valid
    Project.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Project.first
    assert_redirected_to project_url(assigns(:project))
  end
  
  def test_destroy
    project = Project.first
    delete :destroy, :id => project
    assert_redirected_to projects_url
    assert !Project.exists?(project.id)
  end
end
