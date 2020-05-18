class AddCreatorToKetchups < ActiveRecord::Migration[5.2]
  def change
    add_column :ketchups, :creator, :bigint
  end
end
