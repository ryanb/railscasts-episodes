# Generated with:
# rails g model rollout name:string group:string user_id:integer percentage:integer failure_count:integer
class Rollout < ActiveRecord::Base
  def match?(user)
    enabled? && match_group?(user) && match_user?(user) && match_percentage?(user)
  end

  def enabled?
    failure_count.to_i < 1
  end

  def match_group?(user)
    case group
    when "admin" then user.admin?
    else true
    end
  end

  def match_user?(user)
    user_id ? user_id == user.id : true
  end

  def match_percentage?(user)
    percentage ? user.id % 100 < percentage : true
  end
end
