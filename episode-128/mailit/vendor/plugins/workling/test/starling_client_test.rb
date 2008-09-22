require File.dirname(__FILE__) + '/test_helper'

context "The starling client" do
  specify "should load it's config as well as any given MemCache options from RAILS_ENV/config/starling.yml" do
    YAML.expects(:load).returns({ "test" => { "listens_on" => "localhost:12345", "memcache_options" => { "namespace" => "myapp_development" } } })
    
    client = Workling::Starling::Client.new
    client.starling_url.should.equal "localhost:12345"
    client.connection.servers.first.host.should == "localhost"
    client.connection.servers.first.port.should == 12345    
    client.connection.namespace.should.equal "myapp_development"
  end
  
  specify "should load it's config correctly if no memcache options are given" do
    Workling::Starling.send :class_variable_set, "@@config", nil
    YAML.expects(:load).returns({ "test" => { "listens_on" => "localhost:12345" } })
    
    client = Workling::Starling::Client.new
    client.starling_url.should.equal "localhost:12345"
  end  
end