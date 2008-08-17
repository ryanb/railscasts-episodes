require File.dirname(__FILE__) + '/spec_helper'

describe "SubdomainFu URL Writing" do
  before do
    SubdomainFu.tld_size = 1
    default_url_options[:host] = "testapp.com"
  end
  
  describe "#url_for" do
    it "should be able to add a subdomain" do
      url_for(:controller => "something", :action => "other", :subdomain => "awesome").should == "http://awesome.testapp.com/something/other" 
    end
  
    it "should be able to remove a subdomain" do
      url_for(:controller => "something", :action => "other", :subdomain => false, :host => "awesome.testapp.com").should == "http://testapp.com/something/other" 
    end
    
    it "should not change a mirrored subdomain" do
      url_for(:controller => "something", :action => "other", :subdomain => false, :host => "www.testapp.com").should == "http://www.testapp.com/something/other" 
    end
    
    it "should should force the full url, even with :only_path" do
      url_for(:controller => "something", :action => "other", :subdomain => "awesome", :only_path => true).should == "http://awesome.testapp.com/something/other" 
    end
  end
  
  describe "Standard Routes" do
    it "should be able to add a subdomain" do
      needs_subdomain_url(:subdomain => "awesome").should == "http://awesome.testapp.com/needs_subdomain"
    end

    it "should be able to remove a subdomain" do
      default_url_options[:host] = "awesome.testapp.com"
      needs_subdomain_url(:subdomain => false).should == "http://testapp.com/needs_subdomain"
    end

    it "should not change a mirrored subdomain" do
      default_url_options[:host] = "www.testapp.com"
      needs_subdomain_url(:subdomain => false).should == "http://www.testapp.com/needs_subdomain"
    end

    it "should should force the full url, even with _path" do
      needs_subdomain_path(:subdomain => "awesome").should == needs_subdomain_url(:subdomain => "awesome")
    end
    
    it "should not force the full url if it's the same as the current subdomain" do
      default_url_options[:host] = "awesome.testapp.com"
      needs_subdomain_path(:subdomain => "awesome").should == "/needs_subdomain"
    end
    
    it "should not force the full url if the current subdomain is nil and so is the target" do
      needs_subdomain_path(:subdomain => nil).should == "/needs_subdomain"
    end
    
    it "should not force the full url if no :subdomain option is given" do
      needs_subdomain_path.should == "/needs_subdomain"
      default_url_options[:host] = "awesome.testapp.com"
      needs_subdomain_path.should == "/needs_subdomain"
    end
  end
  
  describe "Resourced Routes" do
    it "should be able to add a subdomain" do
      foo_path(:id => "something", :subdomain => "awesome").should == "http://awesome.testapp.com/foos/something"
    end
    
    it "should be able to remove a subdomain" do
      default_url_options[:host] = "awesome.testapp.com"
      foo_path(:id => "something", :subdomain => false).should == "http://testapp.com/foos/something"
    end

    it "should work when passed in a paramable object" do
      foo_path(Paramed.new("something"), :subdomain => "awesome").should == "http://awesome.testapp.com/foos/something"
    end
    
    it "should work on nested resource collections" do
      foo_bars_path(Paramed.new("something"), :subdomain => "awesome").should == "http://awesome.testapp.com/foos/something/bars"
    end
    
    it "should work on nested resource members" do
      foo_bar_path(Paramed.new("something"),Paramed.new("else"), :subdomain => "awesome").should == "http://awesome.testapp.com/foos/something/bars/else"
    end
  end
  
  describe "Preferred Mirror" do
    before do
      SubdomainFu.preferred_mirror = "www"
    end
      
    it "should switch to the preferred mirror instead of no subdomain" do
      default_url_options[:host] = "awesome.testapp.com"
      needs_subdomain_url(:subdomain => false).should == "http://www.testapp.com/needs_subdomain"
    end
    
    it "should force a switch to no subdomain on a mirror if preferred_mirror is false" do
      SubdomainFu.preferred_mirror = false
      default_url_options[:host] = "www.testapp.com"
      needs_subdomain_url(:subdomain => false).should == "http://testapp.com/needs_subdomain"
    end
    
    after do
      SubdomainFu.preferred_mirror = nil
    end
  end
  
  after do
    SubdomainFu.tld_size = 0
    default_url_options[:host] = "localhost"
  end
end