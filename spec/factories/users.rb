require 'faker'

FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'test' }
    email { 'Test@example.com' }
  end

  factory :invalid_user, class: User do
    name { nil }
    email { 'aaa' }
  end

  factory :user2, class: User do
    name { 'testuser2' }
    email { 'test2@example.com' }
  end

  factory :fake_users, class: User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
