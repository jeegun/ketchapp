class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:destroy]

  def create
    @friendship = Friendship.new
    authorize @friendship
    request = FriendRequest.find(params[:friend_request_id])
    @friendship.friend_sender = request.sender
    @friendship.friend_receiver = request.receiver
    @friendship.save!
    Notification.create(recipient: @friendship.friend_sender, actor: @friendship.friend_receiver, action: "has accepted your", notifiable: @friendship)
    request.destroy
    redirect_to users_friend_request_path(current_user)
  end

  def destroy
    @friendship.destroy
    redirect_to users_friend_request_path(current_user)
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
