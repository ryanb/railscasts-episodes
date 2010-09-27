require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Project.new.valid?
  end
end
