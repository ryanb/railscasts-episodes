# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def wiki_link(content)
    content.gsub(/[A-Z]\w+[A-Z]\w+/) do |word|
      link_to word, named_page_path(word)
    end
  end
end
