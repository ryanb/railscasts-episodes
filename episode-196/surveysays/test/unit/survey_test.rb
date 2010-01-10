require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Survey.new.valid?
  end
end
