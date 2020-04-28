class KetchupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_is_creator? || user_is_receiver?
  end

  def create?
    true
  end

  def update?
    user_is_creator? || user_is_receiver?
  end

  def destroy?
    user_is_creator? || user_is_receiver?
  end

  private

  def user_is_creator?
    record.trip.user == user
  end

  def user_is_receiver?
    record.user == user
  end
end
