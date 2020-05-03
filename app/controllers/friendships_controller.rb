class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:destroy]

  def create
    @friendship = Friendship.new
    authorize @friendship
    friend_request = FriendRequest.find(params[:friend_request_id])
    @friendship.friend_sender = friend_request.sender
    @friendship.friend_receiver = friend_request.receiver
    @friendship.save!
    Notification.create(recipient: @friendship.friend_sender, actor: @friendship.friend_receiver, action: "has accepted your", notifiable: friend_request)
    friend_request.status = 'accepted'
    friend_request.save!
    redirect_to user_friends_path(current_user)
  end

  def destroy
    @friendship.destroy
    redirect_to user_friend_requests_path(current_user)
  end

  private

  def set_friendship
    @friendship = Friendship.find(params[:id])
    authorize @friendship
  end

  def friend_request_params
    params.require(:friendship).permit(:friend_sender_id, :friend_receiver_id)
  end
end
