module Workling
  class WorklingError < StandardError; end
  class WorklingNotFoundError < WorklingError; end

  mattr_accessor :load_path
  @@load_path = File.expand_path(File.join(File.dirname(__FILE__), '../../../../app/workers')) 
end