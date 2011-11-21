module UrlFormatter
  module ModelAdditions
    def format_url(attribute)
      before_validation do
        send("#{attribute}=", UrlFormatter.format_url(send(attribute)))
      end
      validates_format_of attribute, with: UrlFormatter.url_regexp, message: "is not a valid URL"
    end
  end
end
