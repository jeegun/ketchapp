class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: [:update, :destroy]

  def create
    @friend_request = FriendRequest.new
    authorize @friend_request
    @friend_request.receiver = User.find(params[:user_id])
    @friend_request.sender = current_user
    @friend_request.status = 'pending'
    @friend_request.save!
    Notification.create(recipient: @friend_request.receiver, actor: current_user, action: "sent you a", notifiable: @friend_request)
    redirect_to user_friends_path(current_user), notice: 'Request sent.'
  end

  # def update
  #   if @friend_request.update(friend_request_params)
  #     redirect_to user_friends_path(current_user)
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @friend_request.destroy
    redirect_to user_friends_path(current_user)
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
    authorize @friend_request
  end

  def friend_request_params
    params.require(:friend_request).permit(:sender_id, :receiver_id, :status)
  end
end
