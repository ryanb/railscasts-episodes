require File.dirname(__FILE__) + '/test_helper.rb'

context "the starling poller" do
  setup do
    routing = Workling::Starling::Routing::ClassAndMethodRouting.new
    # the memoryreturnstore behaves exactly like memcache. 
    @connection = Workling::Return::Store::MemoryReturnStore.new
    @client = Workling::Starling::Poller.new(routing)
  end
  
  specify "should invoke Util.echo with the arg 'hello' if the string 'hello' is set onto the queue utils__echo" do
    Util.any_instance.stubs(:echo).with("hello")
    @connection.set("utils__echo", "hello")
    @client.dispatch!(@connection, Util)
  end
end