require 'test_helper'

class ForumTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Forum.new.valid?
  end
end
