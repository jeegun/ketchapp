class AddEndDateToKetchups < ActiveRecord::Migration[5.2]
  def change
    add_column :ketchups, :end_date, :datetime
  end
end
