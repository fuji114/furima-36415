class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"} 

  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :category_id
    validates :status_id
    validates :invoice_price_id
    validates :invoice_territory_id
    validates :days_to_delivery_id
    validates :product_price
  end
end
