require 'workling/remote/runners/not_remote_runner'
require 'digest/md5'

module Workling
  module Remote
    mattr_accessor :dispatcher
    @@dispatcher = Workling::Remote::Runners::NotRemoteRunner.new
    
    def self.generate_uid(clazz, method)
      uid = ::Digest::MD5.hexdigest("#{ clazz }:#{ method }:#{ rand(1 << 64) }:#{ Time.now }")
      "#{ clazz.to_s.tableize }/#{ method }/#{ uid }".split("/").join(":")
    end
    
    # dispatches to a workling. writes the :uid for this work into the options hash, so make 
    # sure you pass in a hash if you want write to a return store in your workling.
    def self.run(clazz, method, options = {})
      uid = Workling::Remote.generate_uid(clazz, method)
      options[:uid] = uid if options.kind_of?(Hash) && !options[:uid]
      dispatcher.send :run_with_error_handling, clazz, method, options
      uid
    end
  end
end