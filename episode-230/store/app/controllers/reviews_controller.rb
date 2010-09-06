class ReviewsController < InheritedResources::Base
  belongs_to :product
  actions :index, :new, :create
  has_scope :rating
  
  def create
    create! { collection_url }
  end
end
