class ChangeDateToStartDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :ketchups, :date, :start_date
  end
end
