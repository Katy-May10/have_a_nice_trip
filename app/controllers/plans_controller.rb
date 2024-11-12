class PlansController < ApplicationController
  def create
    @plan = Plan.new(plan_params)
    redirect_to itinerary_path(@itinerary)
  end

  def update
    @plan = Plan.find[:id]
    redirect_to itinerary_path(@itinerary)
  end

  private

  def plan_params
    params.require(:plan).permit(:icon_id, :time, :content).merge(user_id: current_user.id, itinerary_id: params[:itinerary_id])
  end
end
