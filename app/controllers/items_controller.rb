class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]
  def index
    # @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :note, :image, :price, :category_id, :status_id, :responsible_id, :region_id,
                                 :shipping_day_id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to user_session_path
  end
end
