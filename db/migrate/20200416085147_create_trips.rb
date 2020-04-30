class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :status
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
