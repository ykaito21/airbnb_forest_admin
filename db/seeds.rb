
require 'faker'

puts 'Creating 10 fake users...'

100.times do
  user = User.create!(
    first_name: Faker::Name.unique.name,
    last_name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    password: "123456"
  )
end
puts 'Finished!'

puts 'Creating 10 fake listings...'

10.times do
  listing = Listing.create!(
    picture: Faker::Placeholdit.image("50x50"),
    home_type: (0..2).to_a.sample,
    address: Faker::Address.street_address,
    location: "#{Faker::Address.latitude}, #{Faker::Address.longitude}",
    price: Faker::Number.between(50, 200)
  )
end
puts 'Finished!'

puts 'Creating 10 fake bookings...'
10.times do
  booking = Booking.create!(
    user_id: (1..10).to_a.sample,
    listing_id: (1..10).to_a.sample,
    checkin_on: Faker::Date.backward(10),
    checkout_on: Faker::Date.forward(10),
    created_at: Faker::Date.between(15.days.ago, Date.today),
    updated_at: Faker::Date.between(5.days.ago, Date.today),
  )
end
puts 'Finished!'
