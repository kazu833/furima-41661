class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end
  
  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_cost_burden_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
