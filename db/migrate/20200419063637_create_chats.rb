class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :recipient_id
      t.integer :sender_id

      t.timestamps
    end
    add_index :chats, :recipient_id, unique: true
    add_index :chats, :sender_id, unique: true
  end
end
