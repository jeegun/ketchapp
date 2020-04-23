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
  end
end
