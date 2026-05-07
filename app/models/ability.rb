class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role  == 'admin'
      can :manage, :all
    else
      can :manage, Property, user_id: user.id
      can :read, Property
    end
  end
end