# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
puts "\n== Seeding the database with fixtures =="
system("bin/rails db:fixtures:load")
puts "== Database successfuly seeded =="

kindergartens = [
  {name: "Guliver", address: "Bate Brkica 1a, 21000 Novi Sad"},
  {name: "Spomenak", address: "Andje Rankovic 9"},
  {name: "Palčica", address: "Branimira Ćosića 40"},
  {name: "Čuperak", address: "Save Kovačevića 7"},
  {name: "Zvončica", address: "Save Kovačevića 14"},
  {name: "Vendi", address: "Braće Dronjak bb"}
  # Add more institutions as needed
]

kindergartens.each do |kindergarten|
  # Geocode the address using Geocoder
  geocoded_data = Geocoder.search(kindergarten[:address]).first

  # Extract latitude and longitude from geocoded data
  latitude = geocoded_data&.latitude
  longitude = geocoded_data&.longitude

  # Create the institution record in the database
  Kindergarten.create(name: kindergarten[:name], address: kindergarten[:address], latitude: latitude, longitude: longitude)
end
