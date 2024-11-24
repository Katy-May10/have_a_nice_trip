class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to records_path(@record.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  private
  def record_params
    params.require(:record).permit(:title).merge(user_id: current_user.id)
  end
end
