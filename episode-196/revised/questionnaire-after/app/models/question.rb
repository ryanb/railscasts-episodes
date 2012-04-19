class Question < ActiveRecord::Base
  attr_accessible :content, :survey_id, :answers_attributes
  belongs_to :survey
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
end
