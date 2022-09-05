# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Favorite.destroy_all
List.destroy_all
Restaurant.destroy_all
User.destroy_all

puts "Creating restaurants..."
client = GooglePlaces::Client.new(ENV.fetch('GOOGLE_MAPS_KEY'))
p client
restaurants = client.spots(-8.6541647, 115.1261915, types: ['restaurant', 'food'], name: "French", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    location: r.formatted_address,
    cuisine: "French",
    phone_number: r.formatted_phone_number
  )
  unless resto.save
    resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
  end
end

restaurants = client.spots(-8.6541647, 115.1261915, types: ['restaurant', 'food'], name: "Indonesian", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    location: r.formatted_address,
    cuisine: "Indonesian",
    phone_number: r.formatted_phone_number
  )
  unless resto.save
    resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
  end
end

puts "Creating users..."
10.times do |i|
  u = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user#{i + 1}@g.com",
    password: 123123
  )
  puts "Created #{u.first_name} #{u.last_name}"
end

puts "Finished!"
