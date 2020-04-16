class CreateKetchups < ActiveRecord::Migration[5.2]
  def change
    create_table :ketchups do |t|
      t.date :date
      t.time :start_time
      t.integer :duratio
      t.string :location
      t.string :message
      t.string :status
      t.float :latitude
      t.float :longitude
      t.references :trip, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
