class PlansController < ApplicationController
  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to itinerary_path(@plan.itinerary.id)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def update
    @plan = Plan.find[:id]
    redirect_to itinerary_path(@plan.itinerary.id)
  end

  private

  def plan_params
    params.require(:plan).permit(:time, :content).merge(user_id: current_user.id, itinerary_id: params[:itinerary_id])
  end
end
