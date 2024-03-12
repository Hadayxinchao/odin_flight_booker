# Flight
Attributes: id, airline, departure_datetime, arrival_datetime, departure_airport_code, destination_airport_code, price

# Booking
Attributes: id, user_id(foreign_key), flight_id(foreign_key), status (e.g pending, confirmed)
Associations: belongs_to :user, belongs_to :flight

# User
Attributes: id, name, email, password(hashed), phone_number
Associations: has_many :bookings

