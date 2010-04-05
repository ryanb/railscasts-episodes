module ApplicationHelper
  def admin_area(&block)
    content_tag(:div, :class => "admin", &block) if admin?
  end
  
  def admin?
    true
  end
end
