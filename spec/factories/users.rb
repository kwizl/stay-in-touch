FactoryBot.define do
  factory :user do
    sequence(:name, 10) { |n| "User#{n}" }
    sequence(:email, 10) { |n| "person#{n}@example.com" }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
