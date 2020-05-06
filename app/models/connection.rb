class Connection < ApplicationRecord
  belongs_to :connection_sender, class_name: :User, optional: true
  belongs_to :connection_receiver, class_name: :User, optional: true
end
