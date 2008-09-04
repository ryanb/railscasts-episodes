class PeopleController < ApplicationController
  def index
    @people = Person.all(:limit => 10)
  end
end
