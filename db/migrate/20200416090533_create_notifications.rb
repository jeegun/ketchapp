class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.boolean :read
      t.string :content
      t.references :ketchup, foreign_key: true
      t.references :trip, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
