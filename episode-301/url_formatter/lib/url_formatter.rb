require "url_formatter/version"
require "url_formatter/model_additions"
require "url_formatter/railtie" if defined? Rails

module UrlFormatter
  def self.format_url(url)
    if url.to_s !~ url_regexp && "http://#{url}" =~ url_regexp
      "http://#{url}"
    else
      url
    end
  end

  def self.url_regexp
    /^https?:\/\/([^\s:@]+:[^\s:@]*@)?[-[[:alnum:]]]+(\.[-[[:alnum:]]]+)+\.?(:\d{1,5})?([\/?]\S*)?$/iux
  end
end
