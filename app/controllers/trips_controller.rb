class TripsController < ApplicationController
  before_action :authenticate_user!

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.save
    redirect_to trip_path(@trip)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def index
    @trips = Trip.all

    if params[:budget].present?
      @trips = @trips.where("budget <= ?", params[:budget])
    end

    if params[:departure].present?
      @trips = @trips.where(departure: params[:departure])
    end

    if params[:destination].present?
      @trips = @trips.where(destination: params[:destination])
    end

    if params[:duration].present?
      @trips = @trips.where("duration <= ?", params[:duration])
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:departure, :budget, :destination, :duration)
  end
end
