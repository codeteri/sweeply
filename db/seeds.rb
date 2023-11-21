# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

listing_info_a = {
  title: 'One bedroom penthouse to be cleaned this Sunday after birthday party',
  type: 'job',
  suburb: 'Sea Point',
  rate: '400',
  description: 'We have everything you need. It shouldnt take longer than 2 hours.'
}

listing_a = Listing.create!(listing_info_a)

puts listing_a
