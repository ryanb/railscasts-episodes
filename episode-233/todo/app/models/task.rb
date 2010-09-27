class Task < ActiveRecord::Base
  attr_accessible :project_id, :name, :completed_at
  belongs_to :project
end
