class ChangeMessageToBeTextInKetchups < ActiveRecord::Migration[5.2]
  def change
    change_column :ketchups, :message, :text
  end
end
