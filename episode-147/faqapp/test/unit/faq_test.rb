require 'test_helper'

class FaqTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Faq.new.valid?
  end
end
