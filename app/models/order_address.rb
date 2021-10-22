class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{2}\z/}
    validates :city
    validates :addresses
    validates :phone_number, numericality: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}

    validates :order_id
    validates :user_id

    validates :token

  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end

end