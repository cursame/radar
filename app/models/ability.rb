class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, User if (user.has_role? :admin) || (user.has_role? :superadmin)
    can :manage, Institution if user.has_role? :superadmin
    can :update, Institution if user.has_role? :admin
    can :manage, Grade if (user.has_role? :admin) || (user.has_role? :superadmin)
    can :manage, Group if (user.has_role? :admin) || (user.has_role? :superadmin)
    can :manage, Student if (user.has_role? :admin) || (user.has_role? :superadmin)
  end
end
