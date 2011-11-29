module UrlFormatter
  module ModelAdditions
    # To format and validate a URL attribute, call <tt>format_url</tt>
    # in any Active Record model class and pass it the name of an attribute.
    #
    #   class User < ActiveRecord::Base
    #     format_url :website
    #   end
    #
    # This will add a <tt>before_validation</tt> callback to add "http://" to
    # the attribute if a protocol doesn't exist already. It then validates the
    # format of the URL.
    def format_url(attribute)
      before_validation do
        send("#{attribute}=", UrlFormatter.format_url(send(attribute)))
      end
      validates_format_of attribute, with: UrlFormatter.url_regexp, message: "is not a valid URL"
    end
  end
end
