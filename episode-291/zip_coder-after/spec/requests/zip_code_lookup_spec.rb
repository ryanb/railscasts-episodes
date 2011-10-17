require "spec_helper"

describe "ZipCodeLookup" do
  it "show Beverly Hills given 90210", :vcr do
    visit root_path
    fill_in "zip_code", with: "90210"
    click_on "Lookup"
    page.should have_content("Beverly Hills")
  end
  
  it "searches RailsCasts", :vcr do
    Capybara.current_driver = :mechanize
    visit "http://railscasts.com"
    fill_in "search", with: "how I test"
    click_on "Search Episodes"
    page.should have_content('#275')
  end
end
