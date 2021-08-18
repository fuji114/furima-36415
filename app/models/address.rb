class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :invoice_territory

  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :building
    validates :phone_number, numericality: { only_integer: true }
  end
  validates :building
end
