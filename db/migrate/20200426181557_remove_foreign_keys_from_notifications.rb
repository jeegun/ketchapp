class RemoveForeignKeysFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_reference :notifications, :ketchup, index: true, foreign_key: true
    remove_reference :notifications, :trip, index: true, foreign_key: true
    remove_reference :notifications, :user, index: true, foreign_key: true
  end
end
