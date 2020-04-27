require 'google/apis/calendar_v3'

class KetchupsController < ApplicationController
  before_action :set_ketchup, only: [:show, :update, :destroy]

  def show
    @year = @ketchup.start_date.strftime('%Y')
    @month = @ketchup.start_date.strftime('%b')
    @day = @ketchup.start_date.strftime('%d')
    @hour = @ketchup.start_date.strftime('%H')
    @minute = @ketchup.start_date.strftime('%M')
    # converting time difference between end_time and start_time to duration in min
    time_diff = ((@ketchup.end_date - @ketchup.start_date) / 60).to_i
    if time_diff >= 60
      h = time_diff / 60
      m = time_diff % 60
      m == 0 ? @duration = "#{h}h" : @duration = "#{h}h #{m}m"
    else
      @duration = "#{time_diff}m"
    end

    # if @ketchup.duration >= 60
    #   h = @ketchup.duration / 60
    #   m = @ketchup.duration % 60
    #   m == 0 ? @duration = "#{h}h" : @duration = "#{h}h #{m}m"
    # else
    #   @duration = "#{@ketchup.duration}m"
    # end
  end

  def create
    @ketchup = Ketchup.new(ketchup_params)
    @trip = Trip.find(params[:trip_id])
    @ketchup.trip = @trip
    @ketchup.status = "pending"
    Notification.create(recipient: @ketchup.user, actor: current_user, action: "has sent you a request to", notifiable: @ketchup)
    if @ketchup.save
      unless current_user.access_token.nil?
        GoogleCalendarWrapper.create(@ketchup, current_user)
      end
      redirect_to ketchup_path(@ketchup), notice: 'Ketchup created.'
    else
      @friends = User.where(["home_city = ?", @trip.location])
      @ketchups = Ketchup.where(["trip_id = ?", @trip.id])
      render 'trips/show'
    end
  end

  def update
    if @ketchup.status == 'pending'
      @ketchup.status = 'confirmed'
      @ketchup.save
      Notification.create(recipient: @ketchup.trip.user, actor: current_user, action: "has confirmed your", notifiable: @ketchup)
      redirect_to ketchup_path(@ketchup), notice: 'This ketchup has been confirmed!'
    else
      if @ketchup.update(ketchup_params)
        Notification.create(recipient: @ketchup.trip.user, actor: current_user, action: "changed the details of your", notifiable: @ketchup)
        redirect_to ketchup_path(@ketchup), notice: 'Ketchup updated!'
      else
        render :edit
      end
    end
  end

  def destroy
    Notification.create(recipient: @ketchup.trip.user, actor: current_user, action: "has declined your", notifiable: @ketchup)
    @ketchup.destroy
    redirect_to trip_path(@ketchup.trip_id)
  end

  private

  def set_ketchup
    @ketchup = Ketchup.find(params[:id])
  end

  def ketchup_params
    params.require(:ketchup).permit(:trip_id, :start_time, :duration, :location, :message, :start_date, :end_date, :status, :user_id)
  end

end
