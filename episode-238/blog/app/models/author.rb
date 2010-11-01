class Author
  include Mongoid::Document
  field :name
  key :name
  references_many :articles
end
