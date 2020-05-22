class Connection < ApplicationRecord
  belongs_to :connection_sender, class_name: :User, optional: true
  belongs_to :connection_receiver, class_name: :User, optional: true

  def opposed_user(user)
    user == self.connection_sender ? connection_receiver : connection_sender
  end
end
