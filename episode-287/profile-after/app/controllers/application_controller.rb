class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end
end
