class UsersController < ApplicationController
  before_action :set_user, only: [:trip, :save, :ketchup, :notification, :friend]

  def trip
    @trips = Trip.where(["user_id = ? AND status= ?", @user.id, "confirmed"])
    @notifications = Notification.where(recipient: current_user).unread
  end

  def save
    @trips = Trip.where(["user_id = ? AND status= ?", @user.id, "saved"])
    @notifications = Notification.where(recipient: current_user).unread
  end

  def ketchup
    @pending_ketchups = Ketchup.where(["user_id = ? AND status= ?", @user.id, "pending"])
    @confirmed_ketchups = Ketchup.where(["user_id = ? AND status= ?", @user.id, "confirmed"])
    @notifications = Notification.where(recipient: current_user).unread
  end

  def notification
    @my_notifications = Notification.where(recipient: @user).order("created_at DESC")
    @notifications = Notification.where(recipient: current_user).unread
  end

  def friend
    @notifications = Notification.where(recipient: current_user).unread
    @sent_requests = FriendRequest.where(["sender_id = ? AND status = ?", @user.id, "pending"])
    @received_requests = FriendRequest.where(["receiver_id = ? AND status = ?", @user.id, "pending"])
    @friendship = Friendship.new
    @friend_request = FriendRequest.new
    contacts = current_user.contacts
    @non_matching_contacts = contacts.map do |contact|
      if User.where(["phone_number = ? OR email = ?", contact.phone_number, contact.email]).empty?
        contact
      end
    end
    @non_matching_contacts.compact!
    matching_contacts = contacts.map do |contact|
      User.where(["phone_number = ? OR email = ?", contact.phone_number, contact.email]).first
    end
    matching_contacts.compact!
    @requestable_users = matching_contacts.map do |contact|
      if (!current_user.is_friend?(current_user.id, contact.id) && FriendRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", current_user.id, contact.id, "pending"]).empty? && FriendRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", contact.id, current_user.id, "pending"]).empty?)
        contact
      end
    end
    @requestable_users.compact!
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
