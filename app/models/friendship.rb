class Friendship < ApplicationRecord
  belongs_to :friend_sender, class_name: :User, optional: true
  belongs_to :friend_receiver, class_name: :User, optional: true
end
