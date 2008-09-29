class MailingsController < ApplicationController
  def deliver
    Mailing.update(params[:id], :scheduled_at => Time.now)
    flash[:notice] = "Delivering mailing"
    redirect_to mailings_url
  end
  
  def index
    @mailings = Mailing.find(:all)
  end
  
  def show
    @mailing = Mailing.find(params[:id])
  end
  
  def new
    @mailing = Mailing.new
  end
  
  def create
    @mailing = Mailing.new(params[:mailing])
    if @mailing.save
      flash[:notice] = "Successfully created mailing."
      redirect_to @mailing
    else
      render :action => 'new'
    end
  end
  
  def edit
    @mailing = Mailing.find(params[:id])
  end
  
  def update
    @mailing = Mailing.find(params[:id])
    if @mailing.update_attributes(params[:mailing])
      flash[:notice] = "Successfully updated mailing."
      redirect_to @mailing
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @mailing = Mailing.find(params[:id])
    @mailing.destroy
    flash[:notice] = "Successfully destroyed mailing."
    redirect_to mailings_url
  end
end
