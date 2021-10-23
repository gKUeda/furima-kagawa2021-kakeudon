class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :exhibitor_confirmation, only: :edit

  def index
    @items = Item.all.order(id: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
    render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :info, :category_id, :salesstatus_id, :shippingfees_id, :prefecture_id,
                                 :delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def exhibitor_confirmation
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path  
    end
  end
end
