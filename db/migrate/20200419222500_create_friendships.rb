class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :friend_sender_id
      t.integer :friend_receiver_id

      t.timestamps
    end
    add_index :friendships, :friend_sender_id
    add_index :friendships, :friend_receiver_id
  end
end
