class Book < ActiveRecord::Base
  attr_accessible :name, :author_ids
  has_many :authorships
  has_many :authors, through: :authorships
end
