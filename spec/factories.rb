FactoryBot.define do
  factory :patient do
    name { "MyText" }
    age { 1 }
    gender { "" }
    date_of_birth { "2023-02-13" }
    address { "MyString" }
    phone_number { "" }
    next_of_kin { "MyString" }
    next_of_kin_phone { "" }
    next_of_kin_address { "MyString" }
  end

  factory(:staff) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
