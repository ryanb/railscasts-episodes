class Author < ActiveRecord::Base
  attr_accessible :name
  has_many :authorships
  has_many :books, through: :authorships
  
  def self.tokens(query)
    authors = where("name like ?", "%#{query}%")
    if authors.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      authors
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end
end
