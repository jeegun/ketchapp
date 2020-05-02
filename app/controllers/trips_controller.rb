class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def show
    maxLat = @trip.latitude + 0.5
    minLat = @trip.latitude - 0.5
    maxLng = @trip.longitude + 0.5
    minLng = @trip.longitude - 0.5
    @friends = User.where(latitude: minLat..maxLat, longitude: minLng..maxLng)
    @friends = @friends.where(["NOT id = ?", current_user.id])
    @ketchup = Ketchup.new
    @start_year = @trip.start_date.strftime('%Y')
    @start_month = @trip.start_date.strftime('%b')
    @start_day = @trip.start_date.strftime('%d')
    @end_year = @trip.end_date.strftime('%Y')
    @end_month = @trip.end_date.strftime('%b')
    @end_day = @trip.end_date.strftime('%d')
    @chat = Chat.new
    @notifications = Notification.where(recipient: current_user).unread
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
      @trip.status = 'confirmed'
      @trip.save
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

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :location, :latitude, :longitude)
  end
end
