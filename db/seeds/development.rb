User.create!(
  name: 'Example User',
  email: 'example@sample.com'
)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@sample.com"
  User.create!(name: name, email: email)
end

users = User.order(:created_at).take(2)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end
