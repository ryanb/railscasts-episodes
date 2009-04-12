require File.dirname(__FILE__) + '/../spec_helper'
 
describe ArticlesController do
  it "should not set position when not saved to database" do
    article = Article.new(:name => "Foo")
    article.position.should be_nil
  end
  
  it "should increment article position when creating next article" do
    article1 = Article.create!(:name => "Foo")
    article2 = Article.create!(:name => "Bar")
    article2.position.should be_one_more_than(article1.position)
  end
end
