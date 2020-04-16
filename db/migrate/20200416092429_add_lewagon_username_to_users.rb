class AddLewagonUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lewagon_username, :string
  end
end
