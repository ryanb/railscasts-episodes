class Book < ActiveRecord::Base
  attr_accessible :name
  has_many :authorships
  has_many :authors, through: :authorships
end
