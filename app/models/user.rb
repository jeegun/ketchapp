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
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :first_name, :last_name, presence: true
  # after_create :send_welcome_email

  def full_name
    return "#{first_name} #{last_name}"
  end

  def self.find_for_google_oauth2(auth)
    # hash 'auth' is the object that is returned from google when an API request
    # is made. 'info' and 'credentials' are hashes within 'auth'
    data = auth.info
    user = User.where(email: auth.info.email).create do |user|
      user.email = auth.info.email
      user.password = '123456'
      user.expires_at = auth.credentials.expires_at.to_i
      user.access_token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.save
      return user
    end
  end

  def expired?
    expires_at < Time.current.to_i
  end

  def friends
    self.friendships_as_friend_sender + self.friendships_as_friend_receiver
  end

  def is_friend?(other)
    Friendship.where(["friend_sender_id =? AND friend_receiver_id =?", self.id, other.id]).present? || Friendship.where(["friend_sender_id =? AND friend_receiver_id =?", other.id, self.id]).present?
  end

  def chats
    self.chats_as_recipient + self.chats_as_sender
  end

  def non_matching_contacts
    non_matching_contacts = self.contacts.map { |contact| contact if User.where(["phone_number = ? OR email = ?", contact.phone_number, contact.email]).empty? }.compact!
  end

  def matching_contacts
    matching_contacts = (self.contacts.map { |contact| User.where(["phone_number = ? OR email = ?", contact.phone_number, contact.email]).first }).compact!
  end

  def match_contacts?(other)
    self.matching_contacts.include?(other)
  end

  def requestable_contacts
    requestable_contacts = self.matching_contacts.map do |contact|
      contact if (!self.is_friend?(contact) && FriendRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", self.id, contact.id, "pending"]).empty? && FriendRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", contact.id, self.id, "pending"]).empty?)
    end
    requestable_contacts.compact!
  end

  def sent_friend_request?(other)
    FriendRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", self.id, other.id, "pending"]).present?
  end

  def received_friend_request?(other)
    FriendRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", other.id, self.id, "pending"]).present?
  end

  private

  def send_welcome_email
    # UserMailer.with(user: self).welcome.deliver_now
  end
end
