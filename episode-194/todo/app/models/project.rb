class Project
  include MongoMapper::Document
  
  key :name, String, :required => true
  key :priority, Integer
  
  many :tasks
end
