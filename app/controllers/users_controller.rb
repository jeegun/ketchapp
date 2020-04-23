class UsersController < ApplicationController
  def trip
    @user = User.find(params[:id])
    @trips = Trip.where(["user_id = ? AND status= ?", @user.id, "confirmed"])
  end

  def save
    @user = User.find(params[:id])
    @trips = Trip.where(["user_id = ? AND status= ?", @user.id, "saved"])
  end

  def friend_request
    @sent_requests = FriendRequest.where(["sender_id = ? AND status = ?", current_user.id, "pending"])
    @received_requests = FriendRequest.where(["receiver_id = ? AND status = ?", current_user.id, "pending"])
    @friendship = Friendship.new
    contacts = current_user.contacts
    matching_contacts = contacts.map do |contact|
      if (User.where(["phone_number = ? OR email = ?", contact.phone_number, contact.email]).first != nil)
        User.where(["phone_number = ? OR email = ?", contact.phone_number, contact.email]).first
      end
    end
    matching_contacts.compact!
    @requestable_users = matching_contacts.map do |contact|
      if (!current_user.is_friend?(current_user.id, contact.id) && !FriendRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", current_user.id, contact.id, "pending"]).any? && !FriendRequest.where(["sender_id = ? AND receiver_id = ? AND status = ?", contact.id, current_user.id, "pending"]).any?)
        contact
      end
    end
    @requestable_users.compact!
  end
end
