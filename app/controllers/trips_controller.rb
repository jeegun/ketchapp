class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
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
      render 'pages/home'
    end
  end

  def show
    @friends = User.where(["home_city = ?", @trip.location])
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
