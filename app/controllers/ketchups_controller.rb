class KetchupsController < ApplicationController
  before_action :set_trip, only: [:new, :create, :destroy]

  def new
    @ketchup = Ketchup.new
  end

  def create
    @ketchup = Ketchup.new(ketchup_params)
    @ketchup.trip = @trip
    if @ketchup.save
      redirect_to @trip, notice: 'Ketchup created.'
    else
      render :new
    end
  end

  def destroy
    @ketchup = Ketchup.find(params[:id])
    @ketchup.destroy
    redirect_to trip_path(@ketchup.trip_id)
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def ketchup_params
    params.require(:ketchup).permit(:trip_id, :location, :message, :date, :status, :user_id)
  end

end
