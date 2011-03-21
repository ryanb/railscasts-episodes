require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Book.new.valid?
  end
end
