require 'google/apis/people_v1'

class UsersController < ApplicationController
  before_action :set_user, only: [:trip, :save, :ketchup, :notification, :connection, :show]
  before_action :set_notifications, only: [:trip, :save, :ketchup, :notification, :connection, :show]
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def show
    @connect_request = ConnectRequest.new
    @connection = Connection.new
    @chat = Chat.new
  end

  def trip
    @trips = Trip.where(["user_id = ? AND status= ?", @user.id, "confirmed"])
    @searches = Trip.where(["user_id = ? AND status= ?", @user.id, "saved"]).where("created_at > ?", 30.days.ago)
  end

  def ketchup
    @active_ketchups = Ketchup.where(["user_id = ? AND start_date >= ? AND NOT status= ? AND NOT creator =?", @user.id, Date.today, "cancelled", @user.id])
    @my_trips = Trip.where(user: @user)
    @my_trips_ketchups = @my_trips.map { |trip| Ketchup.where(["trip_id = ? AND start_date >= ? AND NOT status= ? AND NOT creator =?", trip.id, Date.today, 'cancelled', @user.id]).compact }
    @my_trips_ketchups = @my_trips_ketchups.select { |ketchup| ketchup != [] }
    if @my_trips_ketchups == []
      @received_ketchups = @active_ketchups
    else
      @received_ketchups = @active_ketchups + @my_trips_ketchups.first
    end
    @sent_ketchups = Ketchup.where(["start_date >= ? AND NOT status= ? AND creator =?", Date.today, "cancelled", @user.id])
  end

  def notification
    @my_notifications = Notification.where(recipient: @user).order("created_at DESC")
    @my_trip_notifications = @my_notifications.where(notifiable_type: 'Trip')
    @connection = Connection.new
    @chat = Chat.new
    @ketchup = Ketchup.new
  end

  def connection
    @sent_requests = ConnectRequest.where(["sender_id = ? AND status = ?", @user.id, "pending"])
    @received_requests = ConnectRequest.where(["receiver_id = ? AND status = ?", @user.id, "pending"])
    @connection = Connection.new
    @connect_request = ConnectRequest.new
    @google_contacts = GooglePeopleAPI.get_google_connection_list current_user
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
