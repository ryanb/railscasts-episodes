class Task < ActiveRecord::Base
  attr_accessible :due_at, :name

  def self.due_on(date)
    range = date.beginning_of_day..date.end_of_day
    where(due_at: range)
  end
end
