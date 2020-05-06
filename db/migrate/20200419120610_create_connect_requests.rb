class CreateConnectRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :connect_requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :status

      t.timestamps
    end
    add_index :connect_requests, :sender_id
    add_index :connect_requests, :receiver_id
    add_index :connect_requests, [:sender_id, :receiver_id], unique: true
  end
end
