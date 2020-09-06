FactoryBot.define do
  factory :user do
    name { 'test' }
    sequence(:email) { 'Test1@example.com' }
  end

  factory :invalid_user, class: User do
    name { nil }
    email { 'aaa' }
  end

  factory :user2, class: User do
    name { 'testuser2' }
    email { 'test2@example.com' }
  end
end
