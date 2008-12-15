# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def admin_area(&block)
    if admin?
      concat content_tag(:div, capture(&block), :class => 'admin')
    end
  end
end
