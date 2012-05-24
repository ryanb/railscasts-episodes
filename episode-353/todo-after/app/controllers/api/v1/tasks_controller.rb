module Api
  module V1
    class TasksController < BaseController
      doorkeeper_for :all
      respond_to :json

      def index
        respond_with current_user.tasks
      end

      def create
        respond_with current_user.tasks.create(params[:task])
      end
    end
  end
end
