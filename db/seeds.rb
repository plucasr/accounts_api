require 'faker'




5.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: "password123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  # Create 2 Contacts for each User
  2.times do
    Contact.create!(
      slug: [ "email", "phone" ].sample,
      label: Faker::Lorem.word,
      value: Faker::Internet.email, # or Faker::PhoneNumber.phone_number
      user: user
    )
  end
end

puts "Seeds created successfully!"
