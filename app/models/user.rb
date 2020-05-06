class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trips, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id, dependent: :destroy
  has_many :connect_requests_as_sender,
         foreign_key: :sender_id,
         class_name: :ConnectRequest,
         dependent: :destroy
  has_many :connect_requests_as_receiver,
         foreign_key: :receiver_id,
         class_name: :ConnectRequest,
         dependent: :destroy
  has_many :connections_as_connection_sender,
      foreign_key: :connection_sender_id,
      class_name: :Connection,
      dependent: :destroy
  has_many :connections_as_connection_receiver,
       foreign_key: :connection_receiver_id,
       class_name: :Connection,
       dependent: :destroy
  has_many :connection_senders, through: :connections_as_connection_receiver, dependent: :destroy
  has_many :connection_receivers, through: :connections_as_connection_sender, dependent: :destroy
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

  def connections
    self.connections_as_connection_sender + self.connections_as_connection_receiver
  end

  def is_connection?(other)
    Connection.where(["connection_sender_id =? AND connection_receiver_id =?", self.id, other.id]).present? || Connection.where(["connection_sender_id =? AND connection_receiver_id =?", other.id, self.id]).present?
  end

  def chats
    self.chats_as_recipient + self.chats_as_sender
  end

  # contacts user can invite to ketchup app
  def non_matching_contacts
    non_matching_contacts = self.contacts.map { |contact| contact if User.where(["phone_number = ? OR email = ?", contact.phone_number, contact.email]).empty? }.compact! if self.contacts.present?
  end

  # contacts that matches users already signed up
  def matching_contacts
    matching_contacts = (self.contacts.map { |contact| User.where(["phone_number = ? OR email = ?", contact.phone_number, contact.email]).first }).compact! if self.contacts.present?
  end

  # check if the person is in the contact list
  def match_contacts?(other)
    self.matching_contacts.include?(other) if self.matching_contacts.present?
  end

  # contacts already signed up but not connection nor sent nor received request
  def requestable_contacts
    if self.matching_contacts.present?
      requestable_contacts = self.matching_contacts.map do |contact|
        contact if (!self.is_connection?(contact) && ConnectRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", self.id, contact.id, "pending"]).empty? && ConnectRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", contact.id, self.id, "pending"]).empty?)
      end
      requestable_contacts.compact!
    end
  end

  # check if connect request was already sent
  def sent_connect_request?(other)
    ConnectRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", self.id, other.id, "pending"]).present?
  end

  # check if connect request was already received
  def received_connect_request?(other)
    ConnectRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", other.id, self.id, "pending"]).present?
  end

  private

  def send_welcome_email
    # UserMailer.with(user: self).welcome.deliver_now
  end
end
