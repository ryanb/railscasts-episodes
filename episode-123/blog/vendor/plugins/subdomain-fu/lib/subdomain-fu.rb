require 'subdomain_fu/routing_extensions'
require 'subdomain_fu/url_rewriter'

module SubdomainFu
  # The length of the period-split top-level domain for each environment.
  # For example, "localhost" has a tld_size of zero, and "something.co.uk"
  # has a tld_size of two.
  #
  # To set a tld size for a given environment, just call SubdomainFu.tld_sizes[:environment] = value
  DEFAULT_TLD_SIZES = {:development => 0, :test => 0, :production => 1}
  mattr_accessor :tld_sizes
  @@tld_sizes = DEFAULT_TLD_SIZES.dup
  
  # Subdomains that are equivalent to going to the website with no subdomain at all.
  # Defaults to "www" as the only member.
  mattr_accessor :mirrors
  @@mirrors = %w(www)
  
  mattr_accessor :preferred_mirror
  @@preferred_mirror = nil
  
  # Returns the TLD Size of the current environment.
  def self.tld_size
    tld_sizes[RAILS_ENV.to_sym]
  end
  
  # Sets the TLD Size of the current environment
  def self.tld_size=(value)
    tld_sizes[RAILS_ENV.to_sym] = value
  end
  
  # Is the current subdomain either nil or a mirror?
  def self.has_subdomain?(subdomain)
    !subdomain.blank? && !SubdomainFu.mirrors.include?(subdomain)
  end
  
  # Gets the subdomain from the host based on the TLD size
  def self.subdomain_from(host)
    return nil unless host
    parts = host.split('.')
    sub = parts[0..-(SubdomainFu.tld_size+2)].join(".")
    sub.blank? ? nil : sub
  end
  
  def self.host_without_subdomain(host)
    parts = host.split('.')
    parts[-(SubdomainFu.tld_size+1)..-1].join(".")
  end
  
  # Rewrites the subdomain of the host unless they are equivalent (i.e. mirrors of each other)
  def self.rewrite_host_for_subdomains(subdomain, host)
    unless needs_rewrite?(subdomain, host)
      if has_subdomain?(subdomain) || (subdomain_from(host) == SubdomainFu.preferred_mirror) || (!has_subdomain?(subdomain) && SubdomainFu.preferred_mirror == nil)
        host
      else
        change_subdomain_of_host(SubdomainFu.preferred_mirror, host)
      end
    else
      change_subdomain_of_host(subdomain || SubdomainFu.preferred_mirror, host)
    end
  end
  
  # Changes the subdomain of the host to whatever is passed in.
  def self.change_subdomain_of_host(subdomain, host)
    host = SubdomainFu.host_without_subdomain(host)
    host = "#{subdomain}.#{host}" if subdomain
    host
  end
  
  # Is this subdomain equivalent to the subdomain found in this host string?
  def self.same_subdomain?(subdomain, host)
    subdomain = nil unless subdomain
    (subdomain == SubdomainFu.subdomain_from(host)) || 
      (!SubdomainFu.has_subdomain?(subdomain) && !SubdomainFu.has_subdomain?(SubdomainFu.subdomain_from(host)))
  end
  
  def self.needs_rewrite?(subdomain, host)    
    return false if subdomain.nil?
    subdomain = nil if subdomain.blank?
    (!has_subdomain?(subdomain) && subdomain != SubdomainFu.preferred_mirror && SubdomainFu.preferred_mirror != nil) || 
      !same_subdomain?(subdomain, host)
  end
  
  def self.current_subdomain(request)
    subdomain = request.subdomains(SubdomainFu.tld_size).join(".")
    if has_subdomain?(subdomain)
      subdomain
    else
      nil
    end
  end
  
  module Controller
    def self.included(controller)
      controller.helper_method(:current_subdomain)
    end
    
    protected
    
    def current_subdomain
      SubdomainFu.current_subdomain(request)
    end
  end
end