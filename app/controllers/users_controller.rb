class UsersController < ApplicationController
  def trip
    @user = User.find(params[:id])
    @trips = Trip.where(["user_id = ?", @user.id])
  end

  def friend_request
    @sent_requests = FriendRequest.where(["sender_id = ?", current_user.id])
    @received_requests = FriendRequest.where(["receiver_id = ?", current_user.id])
    @friendship = Friendship.new
  end
end
