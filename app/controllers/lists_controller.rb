class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @spot = Spot.new
    @spots = @list.spots.includes(:user)
  end

  private

  def list_params
    params.require(:list).permit(:sightseeing).merge(user_id: current_user.id)
  end
end
