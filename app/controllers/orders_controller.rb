class OrdersController < ApplicationController
before_action :authenticate_user!, only: :index

def index
  @item = Item.find(params[:item_id])
  @order_address =OrderAddress.new
end

def create
end

end
