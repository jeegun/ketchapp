class CreateKetchups < ActiveRecord::Migration[5.2]
  def change
    create_table :ketchups do |t|
      t.date :date
      t.time :start_time
      t.integer :duratio
      t.string :location
      t.string :message
      t.string :status
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.references :trip, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
