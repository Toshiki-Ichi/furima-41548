class CustomersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    redirect_to root_path if current_user.id == @item.user.id || Customer.where(item_id: @item.id).exists?
    @customer_area = CustomerArea.new
  end

  def create
    @customer_area = CustomerArea.new(customer_params)
    @customer_area.price = @item.price
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    if @customer_area.valid?
      pay_item
      @customer_area.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.require(:customer_area).permit(:postal, :region_id, :city, :city_num, :building, :tel_num, :price).merge(
      user_id: current_user.id, token: params[:token], item_id: params[:item_id], customer_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @customer_area.price,
      card: @customer_area.token,
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
