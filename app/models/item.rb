class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :invoice_price
  belongs_to :status
  belongs_to :invoice_territory
  belongs_to :days_to_delivery

  has_one_attached :image
  belongs_to :user
  has_one :order

  
  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description, length: { maximum: 1000 }
  end
  validates :category_id, :status_id, :invoice_price_id, :invoice_territory_id, :days_to_delivery_id,
            numericality: { other_than: 1, message: "を入力してください" }
  validates :product_price, numericality: { only_integer: true }, inclusion: { in: 300..9_999_999 }, allow_blank: true
  validates :product_price, presence: true
end
