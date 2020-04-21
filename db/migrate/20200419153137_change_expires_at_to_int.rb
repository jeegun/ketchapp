class ChangeExpiresAtToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :expires_at, 'integer USING CAST(expires_at AS integer)'
  end
end
