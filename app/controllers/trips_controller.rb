class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :make_google_calendar_reservations]

  def index
    @trip = Trip.all
  end

  def show
    @friends = User.where(["home_city = ? AND NOT id = ?", @trip.location, current_user.id])
    @ketchup = Ketchup.new
    @start_year = @trip.start_date.strftime('%Y')
    @start_month = @trip.start_date.strftime('%b')
    @start_day = @trip.start_date.strftime('%d')
    @end_year = @trip.end_date.strftime('%Y')
    @end_month = @trip.end_date.strftime('%b')
    @end_day = @trip.end_date.strftime('%d')
    @chat = Chat.new
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.location = (@trip.location.split(' ').map { |e| e.capitalize! }).join(' ')
    @trip.status = "saved"
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render 'pages/home'
    end
  end

  def edit
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

  def make_google_calendar_reservations
    @calendar = GoogleCalWrapper.new(current_user)
    @calendar.book_rooms(@trip)
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :location)
  end
end
