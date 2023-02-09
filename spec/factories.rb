FactoryBot.define do
  factory(:staff) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
  factory(:lab_test) do
    name { Faker::Internet.name }
    price { Faker::Internet.price }
    status { Faker::Internet.status }
    referral_status { Faker::Internet.referral_status }
  end
end
