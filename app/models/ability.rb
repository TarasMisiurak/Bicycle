class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :update, Bicycle, :user_id => user.id
      can :destroy, Bicycle do |bicycle|
        bicycle.user_id == user
      end
      can :create, Bicycle
      can :read, :all
    end
  end
end
