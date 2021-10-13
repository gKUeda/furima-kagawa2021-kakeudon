class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :item_name, presence: true
  validates :info, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :salesstatus_id, numericality: { other_than: 1 }
  validates :shippingfees_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :image, presence: true

  def was_attached?
    self.image.attached?
  end
end



