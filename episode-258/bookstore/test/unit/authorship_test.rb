require 'test_helper'

class AuthorshipTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Authorship.new.valid?
  end
end
