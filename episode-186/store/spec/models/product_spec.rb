require 'spec_helper'

describe Product do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :price => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attributes)
  end
end
