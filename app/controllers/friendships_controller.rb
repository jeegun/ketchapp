class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:destroy]

  def create
    @friendship = Friendship.new
    request = FriendRequest.find(params[:friend_request_id])
    @friendship.friend_sender = request.sender
    @friendship.friend_receiver = request.receiver
    @friendship.save!
    request.destroy
    redirect_to root_path
  end

  def destroy
    @friend_request.destroy
    redirect_to root_path
  end

  private

  def set_friend_request
    @friendship = Friendship.find(params[:id])
  end

  def friend_request_params
    params.require(:friendship).permit(:friend_sender_id, :friend_receiver_id)
  end
end
