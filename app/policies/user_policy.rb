class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def trip?
    user_is_page_owner?
  end

  def save?
    user_is_page_owner?
  end

  def ketchup?
    user_is_page_owner?
  end

  def notification?
    user_is_page_owner?
  end

  def connection?
    user_is_page_owner?
  end

  private

  def user_is_page_owner?
    record == user
  end

end
