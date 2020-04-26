class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_is_creator?
  end

  def create?
    true
  end

  def update?
    user_is_creator?
  end

  def destroy?
    user_is_creator?
  end

  private

  def user_is_creator?
    record.user == user
  end
end
