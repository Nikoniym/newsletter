class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  def index
    @positions=Position.all
  end

  def new
    @position=Position.new
  end

  def show

  end

  def create
    @position=Position.new(position_params)
    if @position.save
      redirect_to  positions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @position.update(position_params)
      redirect_to positions_path
    else
      render :edit
    end
  end

  def destroy
    @position.destroy
    redirect_to  @position
  end

  private

  def set_position
    @position=Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:name)
  end
end