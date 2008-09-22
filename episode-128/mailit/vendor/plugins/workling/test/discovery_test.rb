require File.dirname(__FILE__) + '/test_helper.rb'

context "discovery" do
  specify "should discover the Util workling, since it subclasses Workling::Base and is on the configured Workling load path." do
    discovered = Workling::Discovery.discovered
    discovered.map(&:to_s).should.include "Util"
  end
end