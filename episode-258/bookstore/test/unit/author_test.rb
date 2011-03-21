require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Author.new.valid?
  end
end
