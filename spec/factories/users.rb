FactoryBot.define do
  gimei = Gimei.name
  family_n = gimei.last
  first_n = gimei.first

  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { family_n.kanji }
    first_name { first_n.kanji }
    kana_family_name { family_n.katakana }
    kana_first_name { first_n.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
