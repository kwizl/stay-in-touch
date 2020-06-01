FactoryBot.define do
  factory :user do
    sequence(:name, 20) { |n| "User#{n}" }
    sequence(:email, 20) { |n| "person#{n}@example.com" }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
