class AddCancelReasonToKetchups < ActiveRecord::Migration[5.2]
  def change
    add_column :ketchups, :cancel_reason, :text
  end
end
