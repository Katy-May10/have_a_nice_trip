class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.save
      redirect_to itinerary_path(@itinerary.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @plan = Plan.new
    @plans = @itinerary.plans.includes(:user)
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:location, :departure, :arrival).merge(user_id: current_user.id)
  end
end
