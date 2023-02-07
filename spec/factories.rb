FactoryBot.define do
  factory(:staff) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
