# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

puts "cleaing the database"
Booking.destroy_all
Listing.destroy_all
User.destroy_all

puts "creating users"
user_a = User.create!(name: "Alice", email: "alice@example.com", bio: "Hi I am Alice, I am a dog walker", password: "123456", phone_number: "07515888524", profile_photo: "" )
user_b = User.create!(name: "Bob", email: "bob@example.com", bio: "Hi I am Bob, I am a dog walker", password: "123456", phone_number: "07515888522")
user_c = User.create!(name: "Charlie", email: "charlie@example.com", bio: "Hi I am Charlie, I am a dog walker", password: "123456", phone_number: "07515888523")

puts "Created: #{user_a.name}, #{user_b.name}, #{user_c.name}."


puts "creating a listing..."

listing_info_a = {
  title: 'One bedroom penthouse to be cleaned this Sunday after birthday party',
  category: 'Job',
  suburb: 'Sea Point',
  rate: '400',
  description: 'We have everything you need. It shouldnt take longer than 2 hours.',
  user: user_a
}

listing_info_b = {
  title: 'Two bedroom penthouse to be cleaned this Sunday after birthday party',
  category: 'Job',
  suburb: 'Newlands',
  rate: '400',
  description: 'We have everything you need. It shouldnt take longer than 2 hours.',
  user: user_b
}

listing_info_c = {
  title: 'Three bedroom penthouse to be cleaned this Sunday after birthday party',
  category: 'Job',
  suburb: 'Claremont',
  rate: '400',
  description: 'We have everything you need. It shouldnt take longer than 2 hours.',
  user: user_c
}

listing_a = Listing.create!(listing_info_a)
listing_b = Listing.create!(listing_info_b)
listing_c = Listing.create!(listing_info_c)

puts "listing created."
puts listing_a
puts listing_b
puts listing_c
