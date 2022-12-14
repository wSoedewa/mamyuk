# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Cleaning database..."
Booking.destroy_all
Favorite.destroy_all
Booking.destroy_all
List.destroy_all
Review.destroy_all
Restaurant.destroy_all
User.destroy_all

puts "Creating restaurants..."

client = GooglePlaces::Client.new(ENV.fetch('GOOGLE_MAPS_KEY'))
p client
puts "Creating French restaurants..."
restaurants = client.spots(-8.6541647, 115.1261915, types: ['restaurant', 'food'], name: "French", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    user_ratings_total: r.json_result_object["user_ratings_total"],
    location: r.formatted_address,
    cuisine: "French",
    phone_number: r.formatted_phone_number,
    latitude: r.lat,
    longitude: r.lng,
  )
  unless resto.save
    resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
  end
  puts "Creating review for #{resto.name}"
  r.reviews.first(5).each do |review|
    review = Review.new(
    text: review.text,
    author_name: review.author_name,
    rating: review.rating,
    restaurant_id: resto.id
    )
    review.save
  end

  r.photos.first(5).each do |photo|
    url = photo.fetch_url(500)
    file = URI.open(url)
    resto.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    resto.save
  end
end

puts "Creating Greek restaurants..."
restaurants = client.spots(-8.6541647, 115.1261915, types: ['restaurant', 'food'], name: "Greek", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    user_ratings_total: r.json_result_object["user_ratings_total"],
    location: r.formatted_address,
    cuisine: "Greek",
    phone_number: r.formatted_phone_number,
    latitude: r.lat,
    longitude: r.lng,
  )
  unless resto.save
    resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
  end
  puts "Creating review for #{resto.name}"
  r.reviews.first(5).each do |review|
    review = Review.new(
    text: review.text,
    author_name: review.author_name,
    rating: review.rating,
    restaurant_id: resto.id
    )
    review.save
  end

  r.photos.first(5).each do |photo|
    url = photo.fetch_url(500)
    file = URI.open(url)
    resto.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    resto.save
  end
end

puts "Creating Chinese restaurants..."
restaurants = client.spots(-8.6541647, 115.1261915, types: ['restaurant', 'food'], name: "Chinese", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    user_ratings_total: r.json_result_object["user_ratings_total"],
    location: r.formatted_address,
    cuisine: "Chinese",
    phone_number: r.formatted_phone_number,
    latitude: r.lat,
    longitude: r.lng
  )
  unless resto.save
    resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
  end
  puts "Creating review for #{resto.name}"
  r.reviews.first(5).each do |review|
    review = Review.new(
    text: review.text,
    author_name: review.author_name,
    rating: review.rating,
    restaurant_id: resto.id
    )
    review.save
  end

  r.photos.first(5).each do |photo|
    url = photo.fetch_url(500)
    file = URI.open(url)
    resto.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    resto.save
  end
end

puts "Creating Thai restaurants..."
restaurants = client.spots(-8.6541647, 115.1261915, types: ['restaurant', 'food'], name: "Thai", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    user_ratings_total: r.json_result_object["user_ratings_total"],
    location: r.formatted_address,
    cuisine: "Thai",
    phone_number: r.formatted_phone_number,
    latitude: r.lat,
    longitude: r.lng
  )
  unless resto.save
    resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
  end
  puts "Creating review for #{resto.name}"
  r.reviews.first(5).each do |review|
    review = Review.new(
    text: review.text,
    author_name: review.author_name,
    rating: review.rating,
    restaurant_id: resto.id
    )
    review.save
  end

  r.photos.first(5).each do |photo|
    url = photo.fetch_url(500)
    file = URI.open(url)
    resto.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    resto.save
  end
end

puts "Creating Italian restaurants..."
restaurants = client.spots(-8.6541647, 115.1261915, types: ['restaurant', 'food'], name: "Italian", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    user_ratings_total: r.json_result_object["user_ratings_total"],
    location: r.formatted_address,
    cuisine: "Italian",
    phone_number: r.formatted_phone_number,
    latitude: r.lat,
    longitude: r.lng
    )

    unless resto.save
      resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
    end

    puts "Creating review for #{resto.name}"
    r.reviews.first(5).each do |review|
      review = Review.new(
      text: review.text,
      author_name: review.author_name,
      rating: review.rating,
      restaurant_id: resto.id
      )
      review.save
    end

  r.photos.first(5).each do |photo|
    url = photo.fetch_url(500)
    file = URI.open(url)
    resto.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    resto.save
  end
end

puts "Creating Bar restaurants..."
restaurants = client.spots(-8.6541647, 115.1261915, types: ['bar'], name: "Bar", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    user_ratings_total: r.json_result_object["user_ratings_total"],
    location: r.formatted_address,
    cuisine: "Bar",
    phone_number: r.formatted_phone_number,
    latitude: r.lat,
    longitude: r.lng
  )
  unless resto.save
    resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
  end
  puts "Creating review for #{resto.name}"
  r.reviews.first(5).each do |review|
    review = Review.new(
    text: review.text,
    author_name: review.author_name,
    rating: review.rating,
    restaurant_id: resto.id
    )
    review.save
  end

  r.photos.first(5).each do |photo|
    url = photo.fetch_url(500)
    file = URI.open(url)
    resto.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    resto.save
  end
end

puts "Creating Indonesian restaurants..."
restaurants = client.spots(-8.6541647, 115.1261915, types: ['restaurant', 'food'], name: "Indonesian", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    user_ratings_total: r.json_result_object["user_ratings_total"],
    location: r.formatted_address,
    cuisine: "Indonesian",
    phone_number: r.formatted_phone_number,
    latitude: r.lat,
    longitude: r.lng
  )
  unless resto.save
    resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
  end
  puts "Creating review for #{resto.name}"
  r.reviews.first(5).each do |review|
    review = Review.new(
    text: review.text,
    author_name: review.author_name,
    rating: review.rating,
    restaurant_id: resto.id
    )
    review.save
  end

  r.photos.first(5).each do |photo|
    url = photo.fetch_url(500)
    file = URI.open(url)
    resto.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    resto.save
  end
end

puts "Creating Japanese restaurants..."
restaurants = client.spots(-8.6541647, 115.1261915, types: ['restaurant', 'food'], name: "Japanese", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    user_ratings_total: r.json_result_object["user_ratings_total"],
    location: r.formatted_address,
    cuisine: "Japanese",
    phone_number: r.formatted_phone_number,
    latitude: r.lat,
    longitude: r.lng
  )
  unless resto.save
    resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
  end
  puts "Creating review for #{resto.name}"
  r.reviews.first(5).each do |review|
    review = Review.new(
    text: review.text,
    author_name: review.author_name,
    rating: review.rating,
    restaurant_id: resto.id
    )
    review.save
  end

  r.photos.first(5).each do |photo|
    url = photo.fetch_url(500)
    file = URI.open(url)
    resto.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    resto.save
  end
end

puts "Creating Indian restaurants..."
restaurants = client.spots(-8.6541647, 115.1261915, types: ['restaurant', 'food'], name: "Indian", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    user_ratings_total: r.json_result_object["user_ratings_total"],
    location: r.formatted_address,
    cuisine: "Indian",
    phone_number: r.formatted_phone_number,
    latitude: r.lat,
    longitude: r.lng
  )
  unless resto.save
    resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
  end
  puts "Creating review for #{resto.name}"
  r.reviews.first(5).each do |review|
    review = Review.new(
    text: review.text,
    author_name: review.author_name,
    rating: review.rating,
    restaurant_id: resto.id
    )
    review.save
  end

  r.photos.first(5).each do |photo|
    url = photo.fetch_url(500)
    file = URI.open(url)
    resto.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    resto.save
  end
end

puts "Creating Spanish restaurants..."
restaurants = client.spots(-8.6541647, 115.1261915, types: ['restaurant', 'food'], name: "Spanish", detail: true)
pp restaurants
restaurants.each do |r|
  resto = Restaurant.new(
    name: r.name,
    price: r.price_level,
    rating: r.rating,
    user_ratings_total: r.json_result_object["user_ratings_total"],
    location: r.formatted_address,
    cuisine: "Spanish",
    phone_number: r.formatted_phone_number,
    latitude: r.lat,
    longitude: r.lng
  )
  unless resto.save
    resto = Restaurant.find_by(name: r.name, location: r.formatted_address)
  end
  puts "Creating review for #{resto.name}"
  r.reviews.first(5).each do |review|
    review = Review.new(
    text: review.text,
    author_name: review.author_name,
    rating: review.rating,
    restaurant_id: resto.id
    )
    review.save
  end

  r.photos.first(5).each do |photo|
    url = photo.fetch_url(500)
    file = URI.open(url)
    resto.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    resto.save
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
