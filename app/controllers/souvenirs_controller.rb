class SouvenirsController < ApplicationController
  before_action :authenticate_user!

  def index
    @souvenirs = Souvenir.all
    @souvenir = Souvenir.new
  end

  def create
    @souvenir = Souvenir.new(souvenir_params)
    if @souvenir.save
      redirect_to souvenirs_path(@souvenir.id)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def souvenir_params
    params.require(:souvenir).permit(:who).merge(user_id: current_user.id)
  end
end
