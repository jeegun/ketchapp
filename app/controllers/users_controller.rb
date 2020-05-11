class UsersController < ApplicationController
  before_action :set_user, only: [:trip, :save, :ketchup, :notification, :connection]
  before_action :set_notifications, only: [:trip, :save, :ketchup, :notification, :connection]

  def trip
    @trips = Trip.where(["user_id = ? AND status= ?", @user.id, "confirmed"])
    @searches = Trip.where(["user_id = ? AND status= ?", @user.id, "saved"]).where("created_at > ?", 30.days.ago)
  end

  def ketchup
    @pending_ketchups = Ketchup.where(["user_id = ? AND status= ?", @user.id, "pending"])
    @confirmed_ketchups = Ketchup.where(["user_id = ? AND status= ?", @user.id, "confirmed"])
  end

  def notification
    @my_notifications = Notification.where(recipient: @user).order("created_at DESC")
    @connection = Connection.new
    @chat = Chat.new
  end

  def connection
    @sent_requests = ConnectRequest.where(["sender_id = ? AND status = ?", @user.id, "pending"])
    @received_requests = ConnectRequest.where(["receiver_id = ? AND status = ?", @user.id, "pending"])
    @connection = Connection.new
    @connect_request = ConnectRequest.new
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def set_notifications
    @notifications = Notification.where(recipient: current_user).order("created_at DESC").unread
  end
end
