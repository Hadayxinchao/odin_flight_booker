# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Airport.create(code: 'SFO')
Airport.create(code: 'NYC')
Airport.create(code: 'LAX')
Airport.create(code: 'ORD')

flight1 = Flight.create(
  departure_airport: Airport.find_by(code: 'SFO'),
  arrival_airport: Airport.find_by(code: 'NYC'),
  start_datetime: Time.now + 1.day,
  duration: 300 # in minutes
)

flight2 = Flight.create(
  departure_airport: Airport.find_by(code: 'LAX'),
  arrival_airport: Airport.find_by(code: 'ORD'),
  start_datetime: Time.now + 2.day,
  duration: 270 # in minutes
)