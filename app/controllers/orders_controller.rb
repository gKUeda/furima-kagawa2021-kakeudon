class OrdersController < ApplicationController
before_action :authenticate_user!, only: :index

def index
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new
  binding.pry
end

def create
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new(order_params)
  binding.pry
  if @order_address.valid?
    binding.pry
    pay_item
    @order_address.save
    redirect_to root_path
  else
    binding.pry
    render :index
  end
end

private

  def order_params
    binding.pry
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
    binding.pry
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


end
