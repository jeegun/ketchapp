class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = policy_scope(Notification).order(created_at: :desc)
  end

  def update
    @notification = Notification.find(params[:id])
    authorize @notification
    if @notification.read_at.nil?
      @notification.update!(read_at: Time.zone.now)
    end
    if @notification.notifiable_type == "Friendship" || @notification.notifiable_type == "FriendRequest"
      redirect_to  user_friends_path(@notification.recipient)
    elsif @notification.notifiable_type == "Ketchup"
      redirect_to user_ketchups_path(@notification.recipient)
   end
  end
end
