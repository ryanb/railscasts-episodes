require File.dirname(__FILE__) + '/../spec_helper'
 
describe Article do
  fixtures :all
  
  it "should be editable by admin" do
    article = Article.new(:name => "Foo")
    article.should be_editable_by(users(:admin))
  end
  
  it "should be editable by owner" do
    user = User.new
    article = Article.new(:name => "Foo", :user => user)
    article.should be_editable_by(user)
  end
  
  it "should not be editable by anyone" do
    article = Article.new(:name => "Foo")
    article.should_not be_editable_by(User.new)
  end
end
