# Flight
- Attributes: id, departure_airport_id, arrival_airport_id, start_datetime, flight_duration

# Airport
- Attributes: id, airport_code
- Associations: has_many :flights

# Booking
- Attributes: id, user_id(foreign_key), flight_id(foreign_key), status (e.g pending, confirmed)
- Associations: belongs_to :user, belongs_to :flight

# User
- Attributes: id, name, email, password(hashed), phone_number
- Associations: has_many :bookings