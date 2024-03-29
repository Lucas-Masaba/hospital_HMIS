FactoryBot.define do
  factory :triage do
    name { 'MyText' }
    value_one { 'MyString' }
    value_two { 'MyString' }
    date_time { '2023-02-17 13:52:52' }
  end

  factory :visit_note do
    complaints { 'MyText' }
    provisional_diagnosis { 'MyString' }
  end

  factory :drug do
    name { 'MyString' }
    quantity { 1 }
    location { 'MyString' }
    drug_no { '' }
  end

  factory :prescription do
    product { 'MyString' }
    quantity { 1 }
    symbol { 'MyString' }
    dose { 1 }
    days { 1 }
    stock { 1 }
  end

  factory :patient do
    name { 'MyText' }
    age { 1 }
    gender { '' }
    date_of_birth { '2023-02-13' }
    address { 'MyString' }
    phone_number { '' }
    next_of_kin { 'MyString' }
    next_of_kin_phone { '' }
    next_of_kin_address { 'MyString' }
  end

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
