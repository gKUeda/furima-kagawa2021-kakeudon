require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '商品出品機能' do
    context '商品の出品ができる時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
      it 'ログイン状態の場合のみ、商品出品ページへ遷移できること' do
        @item = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end
  end

  context '商品の出品ができない時' do
    it '商品画像が空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it '商品の説明が空だと出品できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it 'カテゴリーがid:1では出品できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態がid:1では出品できない' do
      @item.salesstatus_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Salesstatus can't be blank")
    end
    it '配送料がid:1では出品できない' do
      @item.shippingfees_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shippingfees can't be blank")
    end
    it '発送元がid:0では出品できない' do
      @item.prefecture_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送日までのid:1では出品できない' do
      @item.delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end
    it '価格が空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が全角数字だと出品できない' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
    end
    it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
    it '販売価格は、10000000以上の値では保存できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
    it 'userが紐づいていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
