require 'spec_helper'

describe "WebRequests" do
  it "creates a new web request resource" do
    FakeWeb.register_uri(:head, "http://example.com/", :content_length => 123)
    visit new_web_request_path
    fill_in "URL", :with => "http://example.com/"
    click_button "Create Web request"
    page.should have_content("http://example.com/")
    page.should have_content("123 Bytes")
  end
end
