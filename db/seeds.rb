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
User.destroy_all
puts "creating users"
User.create!(name: "Alice", email: "alice@example.com", bio: "Hi I am Alice, I am a dog walker", password: "123456", phone_number: "07515888524")
User.create!(name: "Bob", email: "bob@example.com", bio: "Hi I am Bob, I am a dog walker", password: "123456", phone_number: "07515888522")
User.create!(name: "Charlie", email: "charlie@example.com", bio: "Hi I am Charlie, I am a dog walker", password: "123456", phone_number: "07515888523")
puts "finished"
