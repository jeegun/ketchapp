class ConnectionsController < ApplicationController
  before_action :set_connection, only: [:destroy]

  def create
    @connection = Connection.new
    authorize @connection
    connect_request = ConnectRequest.find(params[:connect_request_id])
    @connection.connection_sender = connect_request.sender
    @connection.connection_receiver = connect_request.receiver
    @connection.save!
    notification = Notification.find_by(recipient: current_user, action: "sent you a", notifiable: connect_request)
    notification.update!(read_at: Time.zone.now) if notification.read_at.nil?
    Notification.create(recipient: @connection.connection_sender, actor: @connection.connection_receiver, action: "has accepted your", notifiable: connect_request)
    connect_request.update!(status: 'accepted')
    redirect_to user_connections_path(current_user)
  end

  def destroy
    connect_request = ConnectRequest.find_by(sender: @connection.connection_sender, receiver: @connection.connection_receiver, status: 'accepted')
    @connection.destroy
    connect_request.destroy
    Notification.where(notifiable: connect_request).each { |notification| notification.destroy }
    redirect_to user_connections_path(current_user)
  end

  private

  def set_connection
    @connection = Connection.find(params[:id])
    authorize @connection
  end

  def connection_params
    params.require(:connection).permit(:connection_sender_id, :connection_receiver_id)
  end
end
