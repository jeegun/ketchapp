class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trips, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id, dependent: :destroy
  has_many :friend_requests_as_sender,
         foreign_key: :sender_id,
         class_name: :FriendRequest,
         dependent: :destroy
  has_many :friend_requests_as_receiver,
         foreign_key: :receiver_id,
         class_name: :FriendRequest,
         dependent: :destroy
  has_many :friendships_as_friend_sender,
      foreign_key: :friend_sender_id,
      class_name: :Friendship,
      dependent: :destroy
  has_many :friendships_as_friend_receiver,
       foreign_key: :friend_receiver_id,
       class_name: :Friendship,
       dependent: :destroy
  has_many :friend_senders, through: :friendships_as_friend_receiver, dependent: :destroy
  has_many :friend_receivers, through: :friendships_as_friend_sender, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :chats_as_recipient, foreign_key: :recipient_id, class_name: :Chat, dependent: :destroy
  has_many :chats_as_sender, foreign_key: :sender_id, class_name: :Chat, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :ketchup_requests, through: :trips, source: :ketchups
  has_many :ketchups
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  validates :first_name, :last_name, presence: true
  # after_create :send_welcome_email

  def full_name
    return "#{first_name} #{last_name}"
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(name: data["name"], email: data["email"],
        password: password, password_confirmation: password
      )
    end
    user
  end

  def expired?
    expires_at < Time.current.to_i
  end

  def friends
    self.friendships_as_friend_sender + self.friendships_as_friend_receiver
  end

  def is_friend?(me, other)
    if Friendship.where(["friend_sender_id =? AND friend_receiver_id =?", me, other]).any?
      return true
    elsif Friendship.where(["friend_sender_id =? AND friend_receiver_id =?", other, me]).any?
      return true
    else
      return false
    end
  end

  def chats
    self.chats_as_recipient + self.chats_as_sender
  end

  private

  def send_welcome_email
    # UserMailer.with(user: self).welcome.deliver_now
  end
end
