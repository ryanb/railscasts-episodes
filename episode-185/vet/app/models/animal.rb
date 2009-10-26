class Animal < ActiveRecord::Base
  attr_accessible :name, :category_id, :born_on, :female, :problem_ids
  belongs_to :category
  has_many :symptoms
  has_many :problems, :through => :symptoms
  validates_presence_of :name, :born_on
end
