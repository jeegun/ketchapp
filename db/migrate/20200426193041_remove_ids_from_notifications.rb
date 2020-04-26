class RemoveIdsFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :ketchup_id, :string
    remove_column :notifications, :trip_id, :string
    remove_column :notifications, :user_id, :string
  end
end
