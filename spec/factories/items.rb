FactoryBot.define do
  factory :item do
    image { Faker::Lorem.sentence }
    product_name { '商品' }
    product_description { 'good' }
    category_id { 2 }
    status_id { 2 }
    invoice_price_id { 2 }
    invoice_territory_id { 2 }
    days_to_delivery_id { 2 }
    product_price { 400 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
