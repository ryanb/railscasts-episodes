require 'spec_helper'

describe Task do
  it "validates name" do
    Task.new.should have(1).error_on(:name)
  end
end
