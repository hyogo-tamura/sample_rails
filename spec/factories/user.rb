FactoryBot.define do
  pass = Faker::Internet.password(8)

  factory :user do
    username { Faker::Internet.name }
    email { Faker::Internet.email }
    password { pass }
    password_confirmation { pass }
  end
end
