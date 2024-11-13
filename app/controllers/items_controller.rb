class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :edit]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :set_categories, only: [:new,:create,:edit,:update]
  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
    @categories = Category.new
  end

  def create
    @item = Item.new(item_params)
    @grandchild = Category.find(params[:category_id])
    @item.category = @grandchild # 孫カテゴリーを関連付ける
      @item.user = current_user    # ユーザーの設定    @item.user = current_user

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @category = @item.category
  end

  def edit
    @categories = Category.new
    return unless current_user.id != @item.user.id || Customer.where(item_id: @item.id).exists?

    redirect_to root_path
  end

  def update
    if params[:item][:ancestry].present?
      @grandchild = Category.find(params[:category_id])
      @item.category = @grandchild # 孫カテゴリーを関連付ける
      @item.user = current_user    # ユーザーの設定    @item.user = current_user
    end
    update_params = item_params.compact
    update_params.delete(:images) if update_params[:images].blank? || update_params[:images] == [""]
    update_params.delete(:category) if update_params[:category].blank?
    if @item.update(update_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user.id
      item.destroy
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_categories
    @maincategories = Category.all.order("id ASC").limit(13)
  end

  def item_params
   params.require(:item).permit(:item_name, :note, :price, :status_id, :responsible_id, :region_id, :shipping_day_id,{images: []})
  end

end
