class KetchupsController < ApplicationController
  before_action :set_ketchup, only: [:show, :destroy]

  def show
    @year = @ketchup.date.strftime('%Y')
    @month = @ketchup.date.strftime('%b')
    @day = @ketchup.date.strftime('%d')
    @hour = @ketchup.start_time.strftime('%H')
    @minute = @ketchup.start_time.strftime('%M')
  end

  def create
    @ketchup = Ketchup.new(ketchup_params)
    @trip = Trip.find(params[:trip_id])
    @ketchup.trip = @trip
    @ketchup.status = "pending"
    if @ketchup.save
      redirect_to ketchup_path(@ketchup), notice: 'Ketchup created.'
    else
      @friends = User.where(["home_city = ?", @trip.location])
      render 'trips/show'
    end
  end

  def destroy
    @ketchup.destroy
    redirect_to trip_path(@ketchup.trip_id)
  end

  private

  def set_ketchup
    @ketchup = Ketchup.find(params[:id])
  end

  def ketchup_params
    params.require(:ketchup).permit(:trip_id, :start_time, :duration, :location, :message, :date, :status, :user_id)
  end

end
