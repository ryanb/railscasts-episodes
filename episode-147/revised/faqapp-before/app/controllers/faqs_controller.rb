class FaqsController < ApplicationController
  def index
    @faqs = Faq.all
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save
      redirect_to @faq, notice: "Successfully created FAQ."
    else
      render :new
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])
    if @faq.update_attributes(params[:faq])
      redirect_to @faq, notice: "Successfully updated FAQ."
    else
      render :edit
    end
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    redirect_to faqs_url, notice: "Successfully destroyed FAQ."
  end

  # def sort
  #   params[:faqs].each_with_index do |id, index|
  #     Faq.update_all(['position=?', index+1], ['id=?', id])
  #   end
  #   render :nothing => true
  # end
end
