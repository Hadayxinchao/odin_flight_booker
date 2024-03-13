# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Flight.delete_all
Airport.delete_all

codes = ['NYC', 'MUC', 'HH', 'CHCH', 'AUK']

airports = codes.map do |code|
  Airport.create(code: code)
end

# Create Flights data
flights = []
# NYC - MUC
flights_data = []
5.times do |i|
    flights_data << {
        start_date: Date.today + i.days,
        duration: 8
    }
end
flights += flights_data.each do |flight_data|
    Flight.create(
      start_date: flight_data[:start_date],
      duration: flight_data[:duration],
      departure_airport_id: Airport.find_by(code: 'NYC').id,
      arrival_airport_id: Airport.find_by(code: 'MUC').id
    )
end

# NYC - AUK
flights_data = []
5.times do |i|
    flights_data << {
        start_date: Date.today + i.days,
        duration: 18
    }
end
flights += flights_data.each do |flight_data|
    Flight.create(
      start_date: flight_data[:start_date],
      duration: flight_data[:duration],
      departure_airport_id: Airport.find_by(code: 'NYC').id,
      arrival_airport_id: Airport.find_by(code: 'AUK').id
    )
end

flights_data = []
# HH - MUC
5.times do |i|
    flights_data << {
        start_date: Date.today + i.days,
        duration: 1
    }
end
flights += flights_data.each do |flight_data|
    Flight.create(
      start_date: flight_data[:start_date],
      duration: flight_data[:duration],
      departure_airport_id: Airport.find_by(code: 'HH').id,
      arrival_airport_id: Airport.find_by(code: 'MUC').id
    )
end

flights_data = []
# HH - CHCH
5.times do |i|
    flights_data << {
        start_date: Date.today + i.days,
        duration: 32
    }
end
flights += flights_data.each do |flight_data|
    Flight.create(
      start_date: flight_data[:start_date],
      duration: flight_data[:duration],
      departure_airport_id: Airport.find_by(code: 'HH').id,
      arrival_airport_id: Airport.find_by(code: 'CHCH').id
    )
end