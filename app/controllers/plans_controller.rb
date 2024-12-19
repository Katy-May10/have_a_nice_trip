class PlansController < ApplicationController
  before_action :authenticate_user!

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to itinerary_path(@plan.itinerary.id)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def update
    @itinerary = Itinerary.find(params[:itinerary_id])
    @plan = Plan.find(params[:id])
    redirect_to itinerary_path(@plan.itinerary.id)
  end

  def destroy
    @itinerary = Itinerary.find(params[:itinerary_id])
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to itinerary_path(@plan.itinerary.id)
  end

  private

  def plan_params
    params.require(:plan).permit(:time, :content, :icon_id).merge(user_id: current_user.id, itinerary_id: params[:itinerary_id])
  end
end
