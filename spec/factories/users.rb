FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'example@mail.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
