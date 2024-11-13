class CategoriesController < ApplicationController
  def search
    item = Category.find(params[:id])            # 親カテゴリーを取得
    children_item = item.children                 # 親カテゴリーに関連する子カテゴリーを取得
    grandchildren_item = children_item.map(&:children).flatten  # 子カテゴリーの孫カテゴリーを取得

    # 子カテゴリーと孫カテゴリーの両方をJSON形式で返す
    render json: { item: children_item, grandchildren: grandchildren_item }
  end
end