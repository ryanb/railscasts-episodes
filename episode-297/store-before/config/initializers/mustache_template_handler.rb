module MustacheTemplateHandler
  def self.call(template)
    if template.locals.include? :mustache
      "Mustache.render(#{template.source.inspect}, mustache).html_safe"
    else
      "#{template.source.inspect}.html_safe"
    end
  end
end
ActionView::Template.register_template_handler(:mustache, MustacheTemplateHandler)