class Comment
  include Mongoid::Document
  field :name
  field :content
  embedded_in :article, :inverse_of => :comments
end
