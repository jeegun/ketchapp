class FriendRequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    user_is_sender? || user_is_receiver?
  end

  def destroy?
    user_is_sender? || user_is_receiver?
  end

  private

  def user_is_sender?
    record.sender == user
  end

  def user_is_receiver?
    record.receiver == user
  end
end
