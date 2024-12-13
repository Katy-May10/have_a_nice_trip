class ItinerariesController < ApplicationController
  before_action :authenticate_user!
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

  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    if @itinerary.update(itinerary_params)
      redirect_to itineraries_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    redirect_to itineraries_path
  end

  def download
    @itinerary = Itinerary.find(params[:id]) 
  
    respond_to do |format|
      format.pdf do
        render pdf: "itinerary",
               template: "itineraries/show.html.erb",
               disposition: "attachment"
      end
      format.any { head :not_acceptable }
    end
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:location, :departure, :arrival).merge(user_id: current_user.id)
  end
end
