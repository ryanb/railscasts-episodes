plugin_test = File.dirname(__FILE__)
plugin_root = File.join plugin_test, '..'
plugin_lib = File.join plugin_root, 'lib'

require 'rubygems'
require 'active_support'
require 'test/spec'
require 'mocha'
gem 'memcache-client'
require 'memcache'

$:.unshift plugin_lib, plugin_test

require "mocks/spawn"
require "mocks/logger"
require "workling"
require "workling/discovery"
require "workling/starling/routing/class_and_method_routing"
require "workling/starling/poller"
require "workling/remote"
require "workling/remote/runners/not_remote_runner"
require "workling/remote/runners/spawn_runner"
require "workling/remote/runners/starling_runner"
require "workling/return/store/memory_return_store"
require "workling/return/store/starling_return_store"

RAILS_ROOT = File.dirname(__FILE__) + "/.." # fake the rails root directory.
RAILS_ENV = "test"
RAILS_DEFAULT_LOGGER = Logger.new

# worklings are in here.
Workling.load_path ="#{ plugin_root }/test/workers"
Workling::Return::Store.instance = Workling::Return::Store::MemoryReturnStore.new
Workling::Discovery.discover!