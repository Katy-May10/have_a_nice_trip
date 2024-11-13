class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    redirect_to :show
  end

  def show
    @itinerary = Itinerary.find[:id]
    @plan = Plan.new
    @plans = @itinerary.plans
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
    params.require(:itinerary).permit(:location, :date).merge(user_id: current_user.id)
  end
end
