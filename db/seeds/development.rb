User.create!(
  name: 'Example User',
  email: 'example@sample.com'
)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@sample.com"
  User.create!(name: name, email: email)
end
