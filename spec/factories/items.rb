FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { 2 }
    status_id { 2 }
    payment_id { 2 }
    prefecture_id { 2 }
    delivery_day_id { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
