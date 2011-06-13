class SecretController < ApplicationController
  http_basic_authenticate_with :name => "frodo", :password => "thering"
  def index
  end
end
