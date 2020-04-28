class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(recipient: user).unread
    end
  end

  def mark_as_read?
    user_is_recipient?
  end

  private

  def user_is_recipient?
    record.recipient == user
  end
end
