FactoryBot.define do
  factory :api_access_token do
    association :user, factory: [:user]
    key { SecureRandom.uuid.delete("-") }
  end

  factory :user do
    email { Faker::Internet.email }
    password { "a00000000" }
    password_confirmation { "a00000000" }
  end

  factory :post do
    title { Faker::Lorem.question }
    context { Faker::Lorem.paragraph_by_chars }
  end
end
