class RemoveStartsFromKetchups < ActiveRecord::Migration[5.2]
  def change
    remove_column :ketchups, :start_time, :time
    remove_column :ketchups, :duration, :integer
  end
end
