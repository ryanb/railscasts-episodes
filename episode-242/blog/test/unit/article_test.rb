require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Article.new.valid?
  end
end
