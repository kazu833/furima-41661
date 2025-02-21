FactoryBot.define do
  factory :item do
    item_name                   { Faker::Name.initials(number: 5) }
    description                 { Faker::Lorem.paragraph_by_chars(number: 1000, supplemental: false) }
    category_id                 { (2..11).to_a.sample }
    condition_id                { (2..7).to_a.sample }
    shipping_cost_burden_id     { (2..3).to_a.sample }
    prefecture_id               { (2..48).to_a.sample }
    shipping_day_id             { (2..4).to_a.sample }
    price                       { Faker::Number.between(from: 300, to: 9999999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
