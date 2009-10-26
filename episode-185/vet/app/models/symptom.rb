class Symptom < ActiveRecord::Base
  attr_accessible :animal_id, :problem_id
  belongs_to :animial
  belongs_to :problem
end
