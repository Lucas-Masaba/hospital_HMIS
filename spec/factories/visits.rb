FactoryBot.define do
  factory :visit do
    visit_owner { Faker::Name.name }
    visit_type { Faker::Lorem.word }
    visit_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    visit_category { Faker::Lorem.word[3..10] }
    speciality { Faker::Lorem.word }
    member_no { Faker::Number.number(digits: 10) }
    service { Faker::Lorem.word }
    visit_no { Faker::Number.number(digits: 1) }
  end
end
