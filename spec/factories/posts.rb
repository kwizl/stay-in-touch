FactoryBot.define do
  factory :post do
    content { 'MyString MyString MyString' }
    user
  end
end
