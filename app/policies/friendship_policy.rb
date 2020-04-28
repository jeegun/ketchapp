class FriendshipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    user_is_sender? || user_is_receiver?
  end

  private

  def user_is_sender?
    record.friend_sender == user
  end

  def user_is_receiver?
    record.friend_receiver == user
  end
end
