class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, class_name: :User, optional: true
  belongs_to :recipient, foreign_key: :recipient_id, class_name: :User, optional: true

  validates :sender_id, uniqueness: { scope: :recipient_id }

# returns a chat between two requested users
  # scope :between, -> (sender_id, recipient_id) do
  #   where(sender_id: sender_id, recipient_id: recipient_id).or(
  #     where(sender_id: recipient_id, recipient_id: sender_id)
  #   )
  # end

# tries to get a chat between two users – and if it’s present, it returns it. If there isn’t any, it creates a new one
  # def self.get(sender_id, recipient_id)
  #   chat = between(sender_id, recipient_id).first
  #   return chat if chat.present?

  #   create(sender_id: sender_id, recipient_id: recipient_id)
  # end

# returns an opposed user to the requested user
  def opposed_user(user)
    user == recipient ? sender : recipient
  end
end
