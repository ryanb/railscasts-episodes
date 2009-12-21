require 'test_helper'

class RecommendationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Recommendation.new.valid?
  end
end
