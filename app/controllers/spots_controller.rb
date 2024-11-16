class SpotsController < ApplicationController
  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to list_path(@spot.list.id)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private
  def spot_params
    params.require(:spot).permit(:suggestion).merge(user_id: current_user.id, list_id: params[:list_id])
  end
end
