class Comment < ActiveRecord::Base
  belongs_to :article, touch: true
end
