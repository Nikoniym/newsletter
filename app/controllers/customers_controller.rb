class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :crop, :destroy]

  def index
    @customers = Customer.all
  end

  def crop

  end
  def new
    @customer = Customer.new
  end

  def show

  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to  customers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to  customers_path
  end

  private

  def set_customer
    @customer=Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:avatar, :name, :description, :position_id, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
  end
end