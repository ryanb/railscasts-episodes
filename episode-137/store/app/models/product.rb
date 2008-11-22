class Product < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  belongs_to :category
  
  def filesize(num = 1)
    # some expensive operation
    sleep 2
    12345789 * num
  end
  memoize :filesize
end
