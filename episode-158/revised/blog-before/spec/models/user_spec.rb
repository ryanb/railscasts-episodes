require 'spec_helper'

describe User do
  fixtures :all

  it "authenticates with matching username and password" do
    User.authenticate("batman", "secret").should eq(users(:batman))
  end

  it "does not authenticate with incorrect password" do
    User.authenticate("batman", "incorrect").should be_nil
  end
end
