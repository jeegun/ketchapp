class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trip = Trip.all
  end

  def show
    @friends = User.where(["home_city = ?", @trip.location])
    @ketchup = Ketchup.new
    @start_year = @trip.start_date.strftime('%Y')
    @start_month = @trip.start_date.strftime('%b')
    @start_day = @trip.start_date.strftime('%d')
    @end_year = @trip.end_date.strftime('%Y')
    @end_month = @trip.end_date.strftime('%b')
    @end_day = @trip.end_date.strftime('%d')
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
    @trip.update(trip_params)
    redirect_to @trip, notice: 'Trip updated!'
  end

  def destroy
    @trip.destroy
    redirect_to root_path, notice: 'Trip removed.'
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :location)
  end
end
