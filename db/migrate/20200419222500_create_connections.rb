class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.integer :connection_sender_id
      t.integer :connection_receiver_id

      t.timestamps
    end
    add_index :connections, :connection_sender_id
    add_index :connections, :connection_receiver_id
  end
end
