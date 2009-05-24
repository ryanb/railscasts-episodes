require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
  def test_create_invalid
    Friendship.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Friendship.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end
  
  def test_destroy
    friendship = Friendship.first
    delete :destroy, :id => friendship
    assert_redirected_to root_url
    assert !Friendship.exists?(friendship.id)
  end
end
