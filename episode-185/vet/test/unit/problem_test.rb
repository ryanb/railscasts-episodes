require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Problem.new.valid?
  end
end
