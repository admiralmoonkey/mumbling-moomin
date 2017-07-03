class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    end
    # can :manage, User, id: user.id
    else
      can :create, Comment
      can :read, [Product, Comment]
      can :manage, User, id: user.id
    end
  end
end
