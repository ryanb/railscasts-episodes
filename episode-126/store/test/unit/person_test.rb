require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Person.new.valid?
  end
end
