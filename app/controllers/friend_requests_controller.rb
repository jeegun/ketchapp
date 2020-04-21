class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: [:update, :destroy]

  def create
    @friend_request = FriendRequest.new
    @friend_request.receiver_id = params[:user_id]
    @friend_request.sender = current_user
    @friend_request.status = 'pending'
    @friend_request.save!
    redirect_to root_path, notice: 'Request sent.'
  end

  def update
    if @friend_request.update(friend_request_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @friend_request.destroy
    redirect_to root_path
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end

  def friend_request_params
    params.require(:friend_request).permit(:sender_id, :receiver_id, :status)
  end
end
