class TripsController < ApplicationController
  def index
    @trip = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
  end

  def show
    set_trip
  end

  def edit
    set_trip
  end

  def update
    set_trip
    @trip.update(trip_params)
    redirect_to @trip, notice: 'Trip updated!'
  end

  def destroy
    set_trip
    @trip.destroy
    redirect_to root_path, notice: 'Trip removed.'
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :location)
  end
end
