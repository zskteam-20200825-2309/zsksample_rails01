FactoryBot.define do
  factory :invalid_micropost, class: Micropost do
    content { 'MyText' }
    user_id { 2 }
  end
end
