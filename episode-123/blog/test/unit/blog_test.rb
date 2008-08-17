require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Blog.new.valid?
  end
end
