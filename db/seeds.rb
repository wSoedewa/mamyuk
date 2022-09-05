# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database..."
Favorite.destroy_all
List.destroy_all
Restaurant.destroy_all
User.destroy_all

number = [1, 2, 3, 4]
puts "Creating restaurants..."
10.times do |restaurant|
  r = Restaurant.create!(
    name: Faker::Restaurant.name,
    location: "Canggu, Bali",
    price: number.sample,
    rating: number.sample,
    cuisine: "French",
    phone_number: Faker::PhoneNumber.cell_phone
  )
  puts "Created #{r.name}"
end

puts "Creating users..."
10.times do |user|
  u = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
  puts "Created #{u.first_name} #{u.last_name}"
end


puts "Finished!"
