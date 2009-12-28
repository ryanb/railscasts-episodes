class Task
  include MongoMapper::Document
  
  key :project_id, ObjectId
  key :name, String
  key :completed, Boolean
  
  belongs_to :project
end
