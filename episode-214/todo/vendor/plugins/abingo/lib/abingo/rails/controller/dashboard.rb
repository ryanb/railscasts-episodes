module Abingo
  module Rails
    module Controller
      module Dashboard

        def index
          @experiments = Abingo::Experiment.all
        end

      end
    end
  end
end