require 'test_helper'

class SnippetTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Snippet.new.valid?
  end
end
