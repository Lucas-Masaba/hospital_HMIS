FactoryBot.define do
  factory :visit do
    visit_owner { Faker::Name.name }
    visit_type { Faker::Lorem.word }
    visit_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    visit_category { Faker::Lorem.word }
    speciality { Faker::Lorem.word }
    member_no { Faker::Number.number(digits: 10) }
    service { Faker::Lorem.word }
    visit_no { Faker::Number.number(digits: 1) }
    # visit_owner {'John Doe'}
    # visit_type {'review'}
    # visit_date {'2021-01-01'}
    # visit_category {'insurance'}
    # speciality {'cardiology'}
    # member_no {'123E567A9'}
    # service {'consultation'}
    # visit_no {3}
  end
end
