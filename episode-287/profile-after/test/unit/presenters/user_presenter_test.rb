require 'test_helper'

class UserPresenterTest < ActionView::TestCase
  test "says when none given" do
    presenter = UserPresenter.new(User.new, view)
    assert_match "None given", presenter.website
  end
end