require 'test_helper'

class AuthenticationTest < ActionController::IntegrationTest
  test "logging in with valid username and password" do
    User.create!(:username => "rbates", :email => "ryan@example.com", :password => "secret")
    visit login_url
    fill_in "Username", :with => "rbates"
    fill_in "Password", :with => "secret"
    click_button "Log in"
    assert_contain "Logged in successfully."
  end
  
  test "logging in with invalid username and password" do
    User.create!(:username => "rbates", :email => "ryan@example.com", :password => "secret")
    visit login_url
    fill_in "Username", :with => "rbates"
    fill_in "Password", :with => "badsecret"
    click_button "Log in"
    assert_contain "Invalid login or password."
  end
end
