# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def liquidize(content, arguments)
    RedCloth.new(Liquid::Template.parse(content).render(arguments, :filters => [LiquidFilters])).to_html
  end
end
