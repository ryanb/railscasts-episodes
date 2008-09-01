require File.dirname(__FILE__) + '/spec_helper'

describe "SubdomainFu Routing" do
  it "should resolve if a subdomain is required only when one is provided" # do
    # testapp.com/subdomain_here => 404
    # something.testapp.com/subdomain_here => app/success
  # end 
  
  it "should resolve if a subdomain is prohibited only when one is not provided" # do
    # testapp.com/no_subdomain_here => site/success
    # something.testapp.com/no_subdomain_here => 404
  # end
  
  it "should resolve if a subdomain is prohibited if a mirror is provided" # do
    # www.testapp.com/no_subdomain_hee => site/success
  # end
  
  it "should resolve if a specific subdomain is required only when that subdomain is passed" # do
    # m.testapp.com/m_subdomain_here => mobile/success
    # testapp.com/m_subdomain_here => 404
    # something.testapp.com/m_subdomain_here => 404
  # end
  
  it "should resolve against a regex only if the subdomain matches that regex" # do
    # 123.testapp.com/numbers_here => numbers/success
    # abc.testapp.com/numbers_here => 404
    # testapp.com/numbers_here => 404
  # end
  
  it "should differentiate between multiple identical routes with different subdomain conditions" # do
    # "m.testapp.com" => mobile/home
    # "testapp.com" => site/home
    # "awesome.testapp.com" => app/home
  # end
  
  it "should work on map.resources"
end