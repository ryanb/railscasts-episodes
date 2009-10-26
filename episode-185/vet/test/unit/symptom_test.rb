require 'test_helper'

class SymptomTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Symptom.new.valid?
  end
end
