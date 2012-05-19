class Event < ActiveRecord::Base
  attr_accessible :description, :ends_at, :name, :starts_at
end
