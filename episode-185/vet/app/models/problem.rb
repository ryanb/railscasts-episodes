class Problem < ActiveRecord::Base
  attr_accessible :name
  has_many :symptoms
  has_many :animals, :through => :symptoms
end
