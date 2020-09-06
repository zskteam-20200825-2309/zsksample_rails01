FactoryBot.define do
  factory :user do
    name { 'test' }
    sequence(:email) { 'Test1@example.com' }
  end
end
