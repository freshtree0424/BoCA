FactoryBot.define do
  factory :post do
    user
    title { Faker::Lorem.characters(number:5) }
    body { Faker::Lorem.characters(number:20) }
    star { Faker::Number.between(from: 1, to: 5) }
    score { Faker::Number.between(from: 0, to: 1) }
  end
end