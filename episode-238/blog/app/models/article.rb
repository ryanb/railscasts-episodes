class Article
  include Mongoid::Document
  field :name
  field :content
  field :published_on, :type => Date
  validates_presence_of :name
  embeds_many :comments
  referenced_in :author
end
