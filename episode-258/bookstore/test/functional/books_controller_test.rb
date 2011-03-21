require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Book.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Book.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Book.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to book_url(assigns(:book))
  end

  def test_edit
    get :edit, :id => Book.first
    assert_template 'edit'
  end

  def test_update_invalid
    Book.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Book.first
    assert_template 'edit'
  end

  def test_update_valid
    Book.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Book.first
    assert_redirected_to book_url(assigns(:book))
  end

  def test_destroy
    book = Book.first
    delete :destroy, :id => book
    assert_redirected_to books_url
    assert !Book.exists?(book.id)
  end
end
