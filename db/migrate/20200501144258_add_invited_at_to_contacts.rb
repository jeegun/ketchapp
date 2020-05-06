class AddInvitedAtToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :invited_at, :datetime
  end
end
