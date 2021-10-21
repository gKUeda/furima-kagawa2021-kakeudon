class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :salesstatus
  belongs_to :shippingfees
  belongs_to :prefecture
  belongs_to :delivery

  with_options presence: true do
    validates :image
    validates :item_name
    validates :info
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  end
  validates :price, inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :salesstatus_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shippingfees_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" }
end
