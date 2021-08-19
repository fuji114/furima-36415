FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    invoice_territory_id { 2 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone_number { "08012345678" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
