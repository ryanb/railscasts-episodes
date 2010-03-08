module ApplicationHelper
  def strong(content)
    "<strong>#{h(content)}</strong>".html_safe
  end
end
