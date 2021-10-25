require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.build(:user)
      item = FactoryBot.build(:item)
      @order_delivery = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_delivery.postal_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery.postal_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefecture_idはid:0では保存できないこと' do
        @order_delivery.prefecture_id = '0'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @order_delivery.addresses = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角のハイフンを含まない正しい形式でないと保存できないこと' do
        @order_delivery.phone_number = '03-1234-5678'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it "tokenが空では登録できないこと" do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end