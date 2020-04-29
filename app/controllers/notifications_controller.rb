class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = policy_scope(Notification).order(created_at: :desc)
  end

  def mark_as_read
    # @notifications = policy_scope(Notification).order(created_at: :desc)
    notification = notification.find(data-id)
    # check how to refer to data-id in this method
    notification.update!(read_at: Time.zone.now)
    # render json: {success: true}
  end
end
