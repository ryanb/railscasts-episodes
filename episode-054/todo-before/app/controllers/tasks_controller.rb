class TasksController < ApplicationController
  def index
    @today_tasks = Task.due_on(Date.today)
    @tomorrow_tasks = Task.due_on(Date.tomorrow)
  end
end
