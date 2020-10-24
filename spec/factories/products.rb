FactoryBot.define do
  factory :product do
    association :user

    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/item-sample.png')) }
    name { Faker::Movies::StarWars.character }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 2..11) }
    condition_id { Faker::Number.within(range: 2..7) }
    delivery_charge_id { Faker::Number.within(range: 2..4) }
    delivery_source_id { Faker::Number.within(range: 2..3) }
    days_to_ship_id { Faker::Number.within(range: 2..48) }
    price { Faker::Number.within(range: 300..9_999_999) }
  end
end
