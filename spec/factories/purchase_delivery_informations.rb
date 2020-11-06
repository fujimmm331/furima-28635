FactoryBot.define do
  factory :purchase_delivery_information do
    product { '1' }
    user { '1' }
    postal_code { '123-4567' }
    delivery_source_id { Faker::Number.within(range: 2..48) }
    municipality { '横浜市緑区' }
    address { '青山1-1-1' }
    building {}
    telephone_number { '09011111111' }
    token {'tok_abcdefghijk00000000000000000'}
  end
end
