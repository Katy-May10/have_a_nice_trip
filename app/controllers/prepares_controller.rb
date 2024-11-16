class PreparesController < ApplicationController
  def index
    @prepares = Prepare.all
  end

  def create
    @prepare = Prepare.new(prepare_params)
    if @prepare.save
      redirect_to prepares_path(@prepare.id)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def prepare_params
    params.require(:prepare).permit(:item).merge(user_id: current_user.id)
  end
end
