require File.dirname(__FILE__) + '/../spec_helper'
 
describe User do
  it "should authenticate with matching username and password" do
    user = Factory(:user, :username => 'frank', :password => 'secret')
    User.authenticate('frank', 'secret').should == user
  end
  
  it "should not authenticate with incorrect password" do
    user = Factory(:user, :username => 'frank', :password => 'secret')
    User.authenticate('frank', 'incorrect').should be_nil
  end
end
