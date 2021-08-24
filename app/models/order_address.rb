class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :invoice_territory_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token, :postal_code, :invoice_territory_id, :city, :block, :phone_number, :item_id, :user_id
  end
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }, allow_blank: true
  validates :phone_number, numericality: { only_integer: true, message: 'is invalid' }, length: { in: 10..11 }, allow_blank: true
  validates :invoice_territory_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, invoice_territory_id: invoice_territory_id, city: city, block: block,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
