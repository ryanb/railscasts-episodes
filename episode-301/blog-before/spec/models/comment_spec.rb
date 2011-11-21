# encoding: utf-8
require 'spec_helper'

describe Comment do
  it "adds http:// to URL upon saving" do
    Comment.create!(website: "example.com").website.should eq("http://example.com")
    Comment.create!(website: "http://example.com").website.should eq("http://example.com")
  end

  it "validates URL format" do
    comment = Comment.new(website: "foo bar")
    comment.should_not be_valid
    comment.errors[:website].should eq(["is not a valid URL"])
    comment.website = "example.com"
    comment.should be_valid
  end

  describe ".format_url" do
    it "adds http:// to a URL if not provided" do
      Comment.format_url("example.com").should eq("http://example.com")
    end

    it "does not add http:// to a URL if already provided" do
      Comment.format_url("http://example.com").should eq("http://example.com")
    end

    it "returns an invalid URL unchanged" do
      Comment.format_url("foo bar").should eq("foo bar")
      Comment.format_url(nil).should eq(nil)
    end
  end

  describe ".url_regexp" do
    it "matches valid URLs" do
      [
        'http://example.com/',
        'HTTP://E-XAMLE.COM',
        'https://example.co.uk./foo',
        'http://example.com:8080',
        'http://www.example.com/anything/after?slash',
        'http://www.example.com?anything_after=question',
        'http://user123:sEcr3t@example.com',
        'http://user123:@example.com',
        'http://example.com/~user',
        'http://1.2.3.4:8080',
        'http://ütf8.com',
      ].each do |url|
        url.should match(Comment.url_regexp)
      end
    end

    it "does not match invalid URLs" do
      [
        "www.example.com",
        "http://",
        "http://example..com",
        "http://e xample.com",
        "http://example.com/foo bar",
        "http://example", # technically valid but not what we want from user
        "other://example.com", # we also don't want other protocols
      ].each do |url|
        url.should_not match(Comment.url_regexp)
      end
    end
  end
end
