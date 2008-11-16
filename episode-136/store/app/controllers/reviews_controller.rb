class ReviewsController < ApplicationController
  def create
    @review = Review.create!(params[:review])
    flash[:notice] = "Thank you for reviewing this product"
    respond_to do |format|
      format.html { redirect_to @review.product }
      format.js
    end
  end
end
