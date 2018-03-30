class ZenTimePolicy < ApplicationPolicy
  attr_reader :current_user, :zen_time

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def initialize(current_user, zen_time)
    @current_user = current_user
    @zen_time = zen_time

    # Always require a user
    raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
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

  def create?
    true
  end

  private

    def allow?
      allow_user? or allow_admin?
    end

    def allow_user?
      @current_user.id == @zen_time.user_id
    end

    def allow_admin?
      @current_user.admin?
    end
end
