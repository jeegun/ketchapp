class ChangeKetchupsDateToDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column :ketchups, :date, :datetime
  end
end
