class AddEventToKetchups < ActiveRecord::Migration[5.2]
  def change
    add_column :ketchups, :event, :string
  end
end
