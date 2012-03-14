module Refinery
  module Pianos
    class Piano < Refinery::Core::BaseModel
      self.table_name = 'refinery_pianos'      
    
      acts_as_indexed :fields => [:name, :dimensions, :description]

      validates :name, :presence => true, :uniqueness => true
          
      belongs_to :photo, :class_name => '::Refinery::Image'
        
    end
  end
end
