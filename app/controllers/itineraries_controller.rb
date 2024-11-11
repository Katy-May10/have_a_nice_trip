class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
  end

  def show

  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:location, :date)
  end
end
