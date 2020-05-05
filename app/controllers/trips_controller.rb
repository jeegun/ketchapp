class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :set_people_to_show, only: [:show, :update]

  def show
    @ketchup = Ketchup.new
    @start_year = @trip.start_date.strftime('%Y')
    @start_month = @trip.start_date.strftime('%b')
    @start_day = @trip.start_date.strftime('%d')
    @end_year = @trip.end_date.strftime('%Y')
    @end_month = @trip.end_date.strftime('%b')
    @end_day = @trip.end_date.strftime('%d')
    @chat = Chat.new
    @connect_request = ConnectRequest.new
    @notifications = Notification.where(recipient: current_user).order("created_at DESC").unread
    @default_date = @trip.start_date.strftime('%b %d, %Y 12:00 PM')
    @start_date = @trip.start_date.strftime('%b %d, %Y %I:%M %p')
    @end_date = @trip.end_date.strftime('%b %d, %Y 11:30 PM')
  end

  def create
    @trip = Trip.new(trip_params)
    authorize @trip
    @trip.user = current_user
    dates = params[:trip][:dates].split(' - ')
    start_date = dates.first
    end_date = dates.last
    @trip.start_date = Date.parse(start_date)
    @trip.end_date = Date.parse(end_date)
    # @trip.location = @trip.location.split(",")[0]
    @trip.status = "saved"
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render 'pages/home'
    end
  end

  def update
    if @trip.status == 'saved'
      @trip.update!(status: 'confirmed')
      @people_to_show.each do |people|
        if current_user.is_connection?(people)
          Notification.create(recipient: people, actor: current_user, action: "is coming to your town from #{@trip.start_date.strftime('%b')} #{@trip.start_date.strftime('%d')} to #{@trip.end_date.strftime('%b')} #{@trip.end_date.strftime('%d')}", notifiable: @trip)
        end
      end
      redirect_to trip_path(@trip), notice: 'This trip has been confirmed!'
    else
      if @trip.update(trip_params)
        redirect_to trip_path(@trip), notice: 'Trip updated!'
      else
        render :edit
      end
    end
  end

  def destroy
    @trip.destroy
    redirect_to root_path, notice: 'Trip removed.'
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def set_people_to_show
    maxLat = @trip.latitude + 0.5
    minLat = @trip.latitude - 0.5
    maxLng = @trip.longitude + 0.5
    minLng = @trip.longitude - 0.5
    people_in_radius = User.where(latitude: minLat..maxLat, longitude: minLng..maxLng).where(["NOT id = ?", current_user.id])
    # added @ because we need this for ketchup create form
    @people_in_radius_are_connections = (people_in_radius.map { |people| people if current_user.is_connection?(people) }).compact!
    people_in_radius_in_contact = (people_in_radius.map { |people| people if current_user.match_contacts?(people) }).compact!
    # should we also add people who you sent or you received connect request in this list?
    @people_to_show = (@people_in_radius_are_connections + people_in_radius_in_contact).uniq
  end

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :location, :latitude, :longitude)
  end
end
