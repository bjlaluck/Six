class Ability
  include CanCan::Ability

  def initialize(user)
    



    can [:read, :create, :update], User, id: user.id
    cannot :destroy, User
    can [:read, :create], Comment, id: user.id
    cannot :destroy, Comment
    can [:read], Product, id: user.id
    cannot [:create, :update, :destroy], Product

      if user.admin?
        can :manage, :all
      end

  end
end
