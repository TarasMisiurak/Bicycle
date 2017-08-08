class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.member?
      alias_action :create, :read, :update, :destroy, :to => :crud
      can :update, Bicycle
      can :destroy, Bicycle do |bicycle|
        bicycle.user_id == user
      end
      can :create, Bicycle
      can :crud, FavoriteBicycle, user_id: user.id
      can :read, :all
    end
  end
end
