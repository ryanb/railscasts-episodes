class Event < ActiveRecord::Base
  attr_accessible :description, :ends_at, :name, :starts_at
  has_many :comments, as: :commentable
end
