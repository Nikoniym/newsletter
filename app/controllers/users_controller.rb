class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :crop, :destroy]

  def index
    @users = User.all
  end

  def crop

  end
  def new
    @user = User.new
  end

  def show

  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to  users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to  users_path
  end

  private

  def set_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:avatar, :name, :description, :position_id, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
  end
end