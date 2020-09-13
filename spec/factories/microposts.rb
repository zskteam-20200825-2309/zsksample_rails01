FactoryBot.define do
  factory :micropost do
    content { 'MyText' }
    user_id { 1 }
  end

  factory :invalid_micropost, class: Micropost do
    content { 'MyText' }
    user_id { 2 }
  end

  factory :invalid_micropost_2, class: Micropost do
    content { '' }
    user_id { 1 }
  end

  factory :new_micropost, class: Micropost do
    content { 'YourText' }
    user_id { 1 }
  end
end
