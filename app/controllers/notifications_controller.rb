class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = policy_scope(Notification).order(created_at: :desc)
  end

  def mark_as_read
    @notifications = policy_scope(Notification).order(created_at: :desc)
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
end
