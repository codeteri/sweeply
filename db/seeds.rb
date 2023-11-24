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
require "open-uri"

puts "cleaing the database"
Booking.destroy_all
Listing.destroy_all
User.destroy_all

puts "creating users..."
alice = User.create!(name: "Alice", email: "alice@example.com", bio: "Hi I am Alice, I am a dog walker", password: "123456", phone_number: "07515888524") # profile_photo: "./app/assets/images/alice.jpg")
bob = User.create!(name: "Bob", email: "bob@example.com", bio: "Hi I am Bob, I am a dog walker", password: "123456", phone_number: "07515888522") #profile_photo: "./app/assets/images/bob.jpg")
charlie = User.create!(name: "Charlie", email: "charlie@example.com", bio: "Hi I am Charlie, I am a dog walker", password: "123456", phone_number: "07515888523") #profile_photo: "./app/assets/images/charlie.jpg")
ramon = User.create!(name: "Ramon", email: "ramon@example.com", bio: "Hi I am Ramon, I am a dog walker", password: "123456", phone_number: "07515888583") #profile_photo: "./app/assets/images/ramon.jpg")

puts "adding profile pictures..."

alice_pic = URI.open("https://i.pinimg.com/564x/cc/61/e0/cc61e0afec490d5a8e59ba330c67ab2a.jpg")
alice.profile_photo.attach(io: alice_pic, filename: "cc61e0afec490d5a8e59ba330c67ab2a.jpg", content_type: "image/jpg")
alice.save

bob_pic = URI.open("https://xsgames.co/randomusers/assets/images/favicon.png")
bob.profile_photo.attach(io: bob_pic, filename: "favicon.png", content_type: "image/png")
bob.save

charlie_pic = URI.open("https://xsgames.co/randomusers/assets/avatars/male/46.jpg")
charlie.profile_photo.attach(io: charlie_pic, filename: "46.jpg", content_type: "image/jpg")
charlie.save

ramon_pic = URI.open("https://i.pinimg.com/736x/13/3b/0a/133b0ab0142b8faf0e11ad289ff0749e.jpg")
ramon.profile_photo.attach(io: ramon_pic, filename: "133b0ab0142b8faf0e11ad289ff0749e.jpg", content_type: "image/jpg")
ramon.save

User.all.each do |user|
  puts "#{user.name} added."
end

puts "creating listings..."

listing_info_a = {
  title: 'One bedroom penthouse to be cleaned this Sunday after birthday party',
  category: 'Job',
  suburb: 'Sea Point, Cape Town',
  rate: '500',
  description: 'We have everything you need. It shouldnt take longer than 2 hours.',
  user: alice
}

listing_info_b = {
  title: 'Garage needs sorting & repacking',
  category: 'Job',
  suburb: 'Newlands, Cape Town',
  rate: '2000',
  description: "Needs to be done before end of year. Will probably take 2-3 days. We've bought new shelving and storage boxes.",
  user: bob
}

listing_info_c = {
  title: 'Three bedroom House to be cleaned every Monday',
  category: 'Job',
  suburb: 'Claremont, Cape Town',
  rate: '400',
  description: 'We have everything you need. It shouldnt take longer than 2 hours.',
  user: charlie
}

listing_info_d = {
  title: "I'm available for all your cleaning needs",
  category: 'Service',
  suburb: 'Cape Town',
  rate: '400',
  description: 'We have everything you need. It shouldnt take longer than 2 hours.',
  user: ramon
}

listing_a = Listing.create!(listing_info_a)
listing_b = Listing.create!(listing_info_b)
listing_c = Listing.create!(listing_info_c)
listing_d = Listing.create!(listing_info_d)

puts "adding listing photos..."

list_a_pic = URI.open("https://c8.alamy.com/comp/AWNGKH/party-aftermath-AWNGKH.jpg")
listing_a.photo.attach(io: list_a_pic, filename: "party-aftermath-AWNGKH.jpg", content_type: "image/jpg")
listing_a.save

list_b_pic = URI.open("https://c8.alamy.com/compfr/jah2rc/garage-en-bois-de-mess-portees-en-desordre-chaos-garage-garage-amateur-outils-mess-eclairage-lumiere-jah2rc.jpg")
listing_b.photo.attach(io: list_b_pic, filename: "garage-en-bois-de-mess-portees-en-desordre-chaos-garage-garage-amateur-outils-mess-eclairage-lumiere-jah2rc.jpg", content_type: "image/jpg")
listing_b.save

list_c_pic = URI.open("https://www.ronnathaninteriors.com/wp-content/uploads/2021/02/interior-design-of-a-small-house.jpg")
listing_c.photo.attach(io: list_c_pic, filename: "interior-design-of-a-small-house.jpg", content_type: "image/jpg")
listing_c.save

list_d_pic = URI.open("https://www.cleansweepofamerica.com/wp-content/uploads/2020/10/office-cleaning-service.jpeg")
listing_d.photo.attach(io: list_d_pic, filename: "office-cleaning-service.jpeg", content_type: "image/jpg")
listing_d.save

Listing.all.each do |listing|
  puts "#{listing.user.name}'s #{listing.category} added."
end
