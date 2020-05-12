require 'google/apis/calendar_v3'

class KetchupsController < ApplicationController
  before_action :set_ketchup, only: [:show, :update, :destroy]

  def show
    @year = @ketchup.start_date.strftime('%Y')
    @month = @ketchup.start_date.strftime('%b')
    @day = @ketchup.start_date.strftime('%d')
    @hour = @ketchup.start_date.strftime('%H')
    @minute = @ketchup.start_date.strftime('%M')
    @chat = Chat.new
    # converting time difference between end_time and start_time to duration in min
    @time_diff = ((@ketchup.end_date - @ketchup.start_date) / 60).to_i
    if @time_diff >= 60
      h = @time_diff / 60
      m = @time_diff % 60
      m == 0 ? @duration = "#{h}h" : @duration = "#{h}h #{m}m"
    else
      @duration = "#{@time_diff}m"
    end
    @notifications = Notification.where(recipient: current_user).order("created_at DESC").unread
    @default_date = @ketchup.start_date.strftime('%b %d, %Y %I:%M %p')
    @start_date = @ketchup.trip.start_date.strftime('%b %d, %Y %I:%M %p')
    @end_date = @ketchup.trip.end_date.strftime('%b %d, %Y 11:30 PM')
  end

  def create
    @ketchup = Ketchup.new(ketchup_params)
    authorize @ketchup
    trip = Trip.find(params[:trip_id])
    @ketchup.trip = trip
    @ketchup.end_date = @ketchup.start_date + params[:ketchup][:duration].to_i.minute
    @ketchup.status = "pending"
    if @ketchup.save
      unless current_user.access_token.nil?
        GoogleCalendarWrapper.create(@ketchup, current_user)
      end
      Notification.create(recipient: @ketchup.user, actor: current_user, action: "has sent you a request to", notifiable: @ketchup)
      redirect_to ketchup_path(@ketchup), notice: 'Ketchup created.'
    else
      @trip = Trip.find(params[:trip_id])
      maxLat = @trip.latitude + 0.5
      minLat = @trip.latitude - 0.5
      maxLng = @trip.longitude + 0.5
      minLng = @trip.longitude - 0.5
      people_in_radius = User.where(latitude: minLat..maxLat, longitude: minLng..maxLng).where(["NOT id = ?", current_user.id])
      # added @ because we need this for ketchup create form
      @people_in_radius_are_connections = (people_in_radius.map { |people| people if current_user.is_connection?(people) }).compact
      people_in_radius_in_contact = (people_in_radius.map { |people| people if current_user.match_contacts?(people) }).compact
      # should we also add people who you sent or you received connect request in this list?
      @people_to_show = (@people_in_radius_are_connections + people_in_radius_in_contact).uniq
      @default_date = @trip.start_date.strftime('%b %d, %Y 12:00 PM')
      @start_date = @trip.start_date.strftime('%b %d, %Y %I:%M %p')
      @end_date = @trip.end_date.strftime('%b %d, %Y 11:30 PM')
      @ketchups = Ketchup.where(["trip_id = ?", @trip.id])
      @chat = Chat.new
      @connect_request = ConnectRequest.new
      render 'trips/show'
    end
  end

  def update
    if @ketchup.status == 'pending'
      @ketchup.update!(status: 'confirmed')
      notification = Notification.find_by(recipient: current_user, action: "has sent you a request to", notifiable: @ketchup)
      notification.update!(read_at: Time.zone.now) if notification.read_at.nil?
      Notification.create(recipient: @ketchup.trip.user, actor: current_user, action: "has confirmed your", notifiable: @ketchup)
      KetchupMailer.with(ketchup: @ketchup).confirm_ketchup_creator.deliver_now
      KetchupMailer.with(ketchup: @ketchup).confirm_ketchup_receiver.deliver_now
      redirect_to ketchup_path(@ketchup), notice: 'This ketchup has been confirmed!'
    elsif params[:commit] == 'Cancel'
      @ketchup.status = 'cancelled'
      @ketchup.save
      Notification.create(recipient: @ketchup.trip.user, actor: current_user, action: "has cancelled your", notifiable: @ketchup)
      @ketchup.trip.user = current_user
      redirect_to user_ketchups_path(@ketchup.trip.user), notice: 'Ketchup cancelled!'
    elsif params[:commit] == 'Edit'
      if @ketchup.update(ketchup_params)
        @ketchup.update(end_date: @ketchup.start_date + params[:ketchup][:duration].to_i.minute)
        # GoogleCalendarWrapper.edit(@ketchup, current_user)
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
    if @ketchup.trip.user == current_user
      redirect_to trip_path(@ketchup.trip_id)
    else
      redirect_to root_path
    end
  end

  private

  def set_ketchup
    @ketchup = Ketchup.find(params[:id])
    authorize @ketchup
  end

  def ketchup_params
    params.require(:ketchup).permit(:trip_id, :location, :latitude, :longitude, :message, :start_date, :end_date, :status, :user_id)
  end

end
