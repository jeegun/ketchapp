class FixDurationOnKetchups < ActiveRecord::Migration[5.2]
  def change
    rename_column :ketchups, :duratio, :duration
  end
end
