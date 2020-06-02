FactoryBot.define do
  factory :comment do
    content { 'MyString MyString MyString' }
    post
    user
  end
end
