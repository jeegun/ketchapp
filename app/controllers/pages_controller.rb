class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trip = Trip.new
    @notifications = Notification.where(recipient: current_user).unread
  end
end
