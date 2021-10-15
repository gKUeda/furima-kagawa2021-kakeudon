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

  validates :item_name, presence: true
  validates :info, presence: true
  validates :category_id, numericality: { other_than: 1, message:"Category can't be blank"}
  validates :salesstatus_id, numericality: { other_than: 1, message:"Sales status can't be blank"}
  validates :shippingfees_id, numericality: { other_than: 1, message:"Shipping fee status can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0, message:"Prefecture can't be blank"}
  validates :delivery_id, numericality: {in: 300..9999999,other_than: 1, message:"Scheduled delivery can't be blank"}
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message:"Price is invalid. Input half-width characters" "Price is out of setting range" }
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end



