class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  mapping do
    indexes :id, type: 'integer'
    indexes :author_id, type: 'integer'
    indexes :author_name
    indexes :name, boost: 10
    indexes :content # analyzer: 'snowball'
    indexes :published_at, type: 'date'
    indexes :comments_count, type: 'integer'
  end
  
  def self.search(params)
    tire.search(page: params[:page], per_page: 2) do
      query do
        boolean do
          must { string params[:query], default_operator: "AND" } if params[:query].present?
          must { range :published_at, lte: Time.zone.now }
          must { term :author_id, params[:author_id] } if params[:author_id].present?
        end
      end
      sort { by :published_at, "desc" } if params[:query].blank?
      facet "authors" do
        terms :author_id
      end
      # raise to_curl
    end
  end
  
  # self.include_root_in_json = false (necessary before Rails 3.1)
  def to_indexed_json
    to_json(methods: [:author_name, :comments_count])
  end
  
  def author_name
    author.name
  end
  
  def comments_count
    comments.size
  end
end
