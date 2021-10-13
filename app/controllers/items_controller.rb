class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end
end

private
def item_params
params.require(:item).pemit(:item_name, :info, :category_id, :salesstatus_id, :shippingfees_id, :prefecture_id, :delivery_id, :price).merge(user_id: current_user.id)
end
