module Api
  module V1
    class TasksController < ApplicationController
      respond_to :json

      def index
        respond_with Task.all
      end

      def create
        respond_with Task.create(params[:task])
      end
    end
  end
end
