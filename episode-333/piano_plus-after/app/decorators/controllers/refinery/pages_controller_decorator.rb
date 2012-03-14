Refinery::PagesController.class_eval do
  before_filter :authorize
  
private

  def authorize
    # render text: "Not Authorized"
  end
end