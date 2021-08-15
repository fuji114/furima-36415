class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:status,:invoice_price,:invoice_territory,:days_to_delivery

  has_one_attached :image
  belongs_to :user
  

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description, length: { maximum: 1000 }
    validates :product_price, inclusion: { in: 300..9999999 }
  end

  validates :category_id,:status_id,:invoice_price_id,:invoice_territory_id,:days_to_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 

end
