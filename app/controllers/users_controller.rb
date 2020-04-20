class UsersController < ApplicationController
  def trip
    @user = User.find(params[:id])
    @trips = Trip.where(["user_id = ?", @user.id])
  end

  def friend_request
    @sent_requests = FriendRequest.where(["sender_id = ? AND status = ?", current_user.id, "pending"])
    @received_requests = FriendRequest.where(["receiver_id = ? AND status = ?", current_user.id, "pending"])
    @friendship = Friendship.new
  end
end
