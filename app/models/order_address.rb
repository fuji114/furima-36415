class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :invoice_territory, :city, :block, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :block, :item_id, :user_id
    validates :phone_number, numericality: {only_integer: true, message: 'is invalid'}
  end
  validates :invoice_territory, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code: postal_code, invoice_territory: invoice_territory, city: city, block: block, building: building, order_id: order.id)
  end
  
end