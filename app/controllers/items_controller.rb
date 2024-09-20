class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]
  before_action :authenticate_user!, only: [:edit,]
  before_action :set_item, only: [:edit, :show, :update]
  def index
    @items = Item.includes(:user).order(created_at: :desc)
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

  def show
  end

  def destroy
    if user_signed_in? && current_user.id == item.user.id
      item = Item.find(params[:id])
      item.destroy
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def edit 
    if current_user.id != @item.user.id 
      redirect_to root_path 
    end 
  end 

  def update 
    @item.update(item_params) 
    if @item.save 
      redirect_to item_path(@item) 
    else  
      render :edit, status: :unprocessable_entity 
    end 
  end 

  private

  def set_item
    @item = Item.find(params[:id])
  end
  def item_params
    params.require(:item).permit(:item_name, :note, :image, :price, :category_id, :status_id, :responsible_id, :region_id,
                                 :shipping_day_id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to user_session_path
  end
end
