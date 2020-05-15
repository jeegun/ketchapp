class ConnectRequestsController < ApplicationController
  before_action :set_connect_request, only: [:destroy]

  def create
    @connect_request = ConnectRequest.new
    authorize @connect_request
    @connect_request.receiver = User.find(params[:user_id])
    @connect_request.sender = current_user
    @connect_request.status = 'pending'
    @connect_request.save!
    Notification.create(recipient: @connect_request.receiver, actor: current_user, action: "sent you a", notifiable: @connect_request)
    redirect_to user_connections_path(current_user), notice: 'Request sent.'
  end

  def destroy
    @connect_request.destroy
    redirect_to user_connections_path(current_user)
  end

  private

  def set_connect_request
    @connect_request = ConnectRequest.find(params[:id])
    authorize @connect_request
  end

  def connect_request_params
    params.require(:connect_request).permit(:sender_id, :receiver_id, :status)
  end
end
