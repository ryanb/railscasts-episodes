require 'spec_helper'

describe WebRequest do
  it "fetches the content length" do
    FakeWeb.register_uri(:head, "http://example.com/", :content_length => 123)
    WebRequest.new(:url => "http://example.com/").content_length.should eq(123)
  end
end
