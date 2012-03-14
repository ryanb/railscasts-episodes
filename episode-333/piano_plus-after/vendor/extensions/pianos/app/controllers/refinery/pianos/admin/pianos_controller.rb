module Refinery
  module Pianos
    module Admin
      class PianosController < ::Refinery::AdminController

        crudify :'refinery/pianos/piano',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
