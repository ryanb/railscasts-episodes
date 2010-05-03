class DynamicDelegator < BasicObject
  def initialize(target)
    @target = target
  end
  
  def method_missing(*args, &block)
    result = @target.send(*args, &block)
    @target = result if result.kind_of? @target.class
    result
  end
end