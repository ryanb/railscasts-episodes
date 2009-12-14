class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, Comment
      can :update, Comment do |comment|
        comment.try(:user) == user || user.role?(:moderator)
      end
      if user.role?(:author)
        can :create, Article
        can :update, Article do |article|
          article.try(:user) == user
        end
      end
    end
  end
end
