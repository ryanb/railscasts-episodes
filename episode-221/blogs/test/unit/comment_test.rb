require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Comment.new.valid?
  end
end
