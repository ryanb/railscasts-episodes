class Task < ActiveRecord::Base
  attr_accessible :due_at, :name

  def self.due_on(date)
    range = date.to_time...(date+1).to_time
    where(due_at: range)
  end
end
