require 'subdomain-fu'

ActionController::Base.send :include, SubdomainFu::Controller

RAILS_DEFAULT_LOGGER.info("** SubdomainFu: initialized properly")