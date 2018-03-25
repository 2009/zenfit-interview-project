class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.manager?
        scope.where(role: 'user')
      else
        scope.where(id: user.id)
      end
    end
  end

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    allow?
  end

  def update?
    allow?
  end

  def destroy?
    allow?
  end

  # Always allow user creation
  def create?
    true
  end

  # Restrict role attribute
  def permitted_attributes
    if @current_user and @current_user.admin?
      [:email, :password, :password_confirmation, :role]
    else
      [:email, :password, :password_confirmation]
    end
  end


  private

    def allow?
      logged_in? and (allow_user? or allow_manager? or allow_admin?)
    end

    def logged_in?
      @current_user
    end

    def allow_user?
      @current_user.id == @user.id
    end

    def allow_manager?
      @current_user.manager? and not (@user.admin? or @user.manager?)
    end

    def allow_admin?
      @current_user.admin?
    end
end
