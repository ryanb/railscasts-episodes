class User < ActiveRecord::Base
  def member_since
    created_at.strftime("%B %e, %Y")
  end
end
