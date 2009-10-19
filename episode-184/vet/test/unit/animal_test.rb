require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Animal.new.valid?
  end
end
