FactoryBot.define do
  factory :prescription do
    product { Faker::Lorem.word }
    quantity { Faker::Number.number(digits: 1) }
    dose { Faker::Number.number(digits: 1) }
    symbol { Faker::Lorem.word }
    days { Faker::Number.number(digits: 1) }
    stock { Faker::Number.number(digits: 1) }
    visit { Visit.all.sample || association(:visit, visit_id) }
    # visit { create(:visit=> visit_id) }
  end
end