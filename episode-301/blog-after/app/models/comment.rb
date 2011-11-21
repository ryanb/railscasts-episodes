class Comment < ActiveRecord::Base
  belongs_to :article

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

  before_validation do
    self.website = self.class.format_url(website)
  end

  validates_format_of :website, with: url_regexp, message: "is not a valid URL"
end
