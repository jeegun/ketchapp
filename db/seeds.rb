require 'faker'
users_data = [
  {
    email: "ellyn@gmail.com",
    password: "123456",
    first_name: "Ellyn",
    last_name: "Bouscasse",
    home_city: "Barcelona",
    latitude: 41.3851,
    longitude: 2.1734,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "EllynBsc"
  },
  {
    email: "avalon@gmail.com",
    password: "123456",
    first_name: "Avalon",
    last_name: "van der Horst",
    home_city: "Barcelona",
    latitude: 41.3851,
    longitude: 2.1734,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "Avalonvdhorst"
  },
  {
    email: "alexander@gmail.com",
    password: "123456",
    first_name: "Alexander",
    last_name: "Dubovoy",
    home_city: "Barcelona",
    latitude: 41.3851,
    longitude: 2.1734,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "ajdubovoy"
  },
  {
    email: "prima@gmail.com",
    password: "123456",
    first_name: "Prima",
    last_name: "Aulia Gusta",
    home_city: "Barcelona",
    latitude: 41.3851,
    longitude: 2.1734,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "primaulia"
  },
  {
    email: "louise@gmail.com",
    password: "123456",
    first_name: "Louise",
    last_name: "Darche",
    home_city: "Barcelona",
    latitude: 41.3851,
    longitude: 2.1734,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "LouiseDarche"
  },
  {
    email: "sangsoo@gmail.com",
    password: "123456",
    first_name: "Sangsoo",
    last_name: "Ra",
    home_city: "Barcelona",
    latitude: 41.3851,
    longitude: 2.1734,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "sangsoora"
  },
  {
    email: "valerie@gmail.com",
    password: "123456",
    first_name: "Valerie",
    last_name: "Schraauwers",
    home_city: "New York City",
    latitude: 40.7128,
    longitude: -74.0060,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "valerieschraauwers"
  },
  {
    email: "claire@gmail.com",
    password: "123456",
    first_name: "Claire",
    last_name: "Gautier",
    home_city: "New York City",
    latitude: 40.7128,
    longitude: -74.0060,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "claire-gtr"
  },
  {
    email: "fanny@gmail.com",
    password: "123456",
    first_name: "Fanny",
    last_name: "Rojon",
    home_city: "New York City",
    latitude: 40.7128,
    longitude: -74.0060,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "fanny-rojon"
  },
  {
    email: "lorenzo@gmail.com",
    password: "123456",
    first_name: "Lorenzo",
    last_name: "Del Castillo Detoeuf",
    home_city: "New York City",
    latitude: 40.7128,
    longitude: -74.0060,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "ldeld"
  },
  {
    email: "jensen@gmail.com",
    password: "123456",
    first_name: "Jensen",
    last_name: "Daniel",
    home_city: "New York City",
    latitude: 40.7128,
    longitude: -74.0060,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "jiggyjensen"
  },
  {
    email: "juan@gmail.com",
    password: "123456",
    first_name: "Juan",
    last_name: "Estrella",
    home_city: "New York City",
    latitude: 40.7128,
    longitude: -74.0060,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "TheJuanAndOnly99"
  },
  {
    email: "joyce@gmail.com",
    password: "123456",
    first_name: "Joyce",
    last_name: "Cakmak",
    home_city: "Los Angeles",
    latitude: 34.0522,
    longitude: -118.2437,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "Joyckc"
  },
  {
    email: "jeegun@gmail.com",
    password: "123456",
    first_name: "Jeegun",
    last_name: "Kim",
    home_city: "Los Angeles",
    latitude: 34.0522,
    longitude: -118.2437,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "jeegun"
  },
  {
    email: "maxime@gmail.com",
    password: "123456",
    first_name: "Maxime",
    last_name: "Geurts",
    home_city: "Los Angeles",
    latitude: 34.0522,
    longitude: -118.2437,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "Max51555"
  },
  {
    email: "laura@gmail.com",
    password: "123456",
    first_name: "Laura",
    last_name: "Helmert",
    home_city: "Los Angeles",
    latitude: 34.0522,
    longitude: -118.2437,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "lhelmert"
  },
  {
    email: "robert@gmail.com",
    password: "123456",
    first_name: "Robert",
    last_name: "King",
    home_city: "Los Angeles",
    latitude: 34.0522,
    longitude: -118.2437,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "RobOwenKing"
  },
  {
    email: "tamas@gmail.com",
    password: "123456",
    first_name: "Tamas",
    last_name: "Papp",
    home_city: "Los Angeles",
    latitude: 34.0522,
    longitude: -118.2437,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "tomapapp"
  },
  {
    email: "elena@gmail.com",
    password: "123456",
    first_name: "Elena",
    last_name: "Vigo Olivan",
    home_city: "Seoul",
    latitude: 37.5665,
    longitude: 126.9780,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "elenavigo"
  },
  {
    email: "michael@gmail.com",
    password: "123456",
    first_name: "Michael",
    last_name: "Wlaschitz",
    home_city: "Seoul",
    latitude: 37.5665,
    longitude: 126.9780,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "michaelwlaschitz"
  },
  {
    email: "leon@gmail.com",
    password: "123456",
    first_name: "Leon",
    last_name: "Ellerbrock",
    home_city: "Seoul",
    latitude: 37.5665,
    longitude: 126.9780,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "leonellerbrock"
  },
  {
    email: "raphael@gmail.com",
    password: "123456",
    first_name: "Raphael",
    last_name: "Daverio",
    home_city: "Seoul",
    latitude: 37.5665,
    longitude: 126.9780,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "raph-dav"
  },
  {
    email: "antoine@gmail.com",
    password: "123456",
    first_name: "Antoine",
    last_name: "De Broqueville",
    home_city: "Seoul",
    latitude: 37.5665,
    longitude: 126.9780,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "Boukto2708"
  },
  {
    email: "ry@gmail.com",
    password: "123456",
    first_name: "Ry",
    last_name: "Ellingson",
    home_city: "Seoul",
    latitude: 37.5665,
    longitude: 126.9780,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "ryellingson"
  },
  {
    email: "marin@gmail.com",
    password: "123456",
    first_name: "Marin",
    last_name: "Bibot",
    home_city: "Mumbai",
    latitude: 19.0760,
    longitude: 72.8777,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "Marin-b"
  },
  {
    email: "cassandre@gmail.com",
    password: "123456",
    first_name: "Cassandre",
    last_name: "Houzé De L'Aulnoit",
    home_city: "Mumbai",
    latitude: 19.0760,
    longitude: 72.8777,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "CassandreHouze"
  },
  {
    email: "ikram@gmail.com",
    password: "123456",
    first_name: "Ikram",
    last_name: "Akhlaq",
    home_city: "Mumbai",
    latitude: 19.0760,
    longitude: 72.8777,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "IkramAkhlaq"
  },
  {
    email: "marco@gmail.com",
    password: "123456",
    first_name: "Marco",
    last_name: "De Biolley",
    home_city: "Mumbai",
    latitude: 19.0760,
    longitude: 72.8777,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "marcdebiolley"
  },
  {
    email: "emiliano@gmail.com",
    password: "123456",
    first_name: "Emiliano",
    last_name: "Dogaru",
    home_city: "Mumbai",
    latitude: 19.0760,
    longitude: 72.8777,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "dogaruemiliano"
  },
  {
    email: "abder@gmail.com",
    password: "123456",
    first_name: "Aber",
    last_name: "Nadifi",
    home_city: "Mumbai",
    latitude: 19.0760,
    longitude: 72.8777,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "Abder007"
  }
]

puts "*" * 60
puts "Seeding started"
puts "=" * 60
puts "-" * 60
puts "Cleaning database"
puts "-" * 60

Notification.destroy_all
puts "Destroyed all notifications"
Ketchup.destroy_all
puts "Destroyed all ketchups"
Trip.destroy_all
puts "Destroyed all trips"
User.destroy_all
puts "Destroyed all users"

puts "-" * 60
puts "Destroyed all data"
puts "-" * 60
puts "=" * 60
puts "-" * 60
puts "Creating users"
puts "-" * 60

users_data.each do |user_data|
  user = User.create!(user_data)
end

puts "-" * 60
puts "Users created"
puts "-" * 60
puts "=" * 60
puts "-" * 60
puts "Creating trips"
puts "-" * 60

Trip.create!(start_date: Date.new(2019, 12, 21), end_date: Date.new(2020, 1, 4), location: 'Barcelona', status: 'saved', latitude: 41.3851, longitude: 2.1734, user_id: 11)
Trip.create!(start_date: Date.new(2019, 12, 18), end_date: Date.new(2020, 1, 23), location: 'New York City', status: 'saved', latitude: 40.7128, longitude: -74.0060, user_id: 6)
Trip.create!(start_date: Date.new(2019, 12, 29), end_date: Date.new(2020, 1, 12), location: 'Mumbai', status: 'saved', latitude: 19.0760, longitude: 72.8777, user_id: 14)
Trip.create!(start_date: Date.new(2020, 4, 18), end_date: Date.new(2020, 4, 28), location: 'Los Angeles', status: 'saved', latitude: 34.0522, longitude: -118.2437, user_id: 6)
Trip.create!(start_date: Date.new(2020, 4, 20), end_date: Date.new(2020, 4, 25), location: 'Barcelona', status: 'saved', latitude: 41.3851, longitude: 2.1734, user_id: 14)
Trip.create!(start_date: Date.new(2020, 4, 21), end_date: Date.new(2020, 4, 29), location: 'Los Angeles', status: 'saved', latitude: 34.0522, longitude: -118.2437, user_id: 11)
Trip.create!(start_date: Date.new(2020, 5, 2), end_date: Date.new(2020, 5, 13), location: 'Seoul', status: 'saved', latitude: 37.5665, longitude: 126.9780, user_id: 6)
Trip.create!(start_date: Date.new(2020, 5, 2), end_date: Date.new(2020, 5, 9), location: 'New York City', status: 'saved', latitude: 40.7128, longitude: -74.0060, user_id: 14)
Trip.create!(start_date: Date.new(2020, 5, 10), end_date: Date.new(2020, 6, 2), location: 'Seoul', status: 'saved', latitude: 37.5665, longitude: 126.9780, user_id: 14)
Trip.create!(start_date: Date.new(2020, 5, 18), end_date: Date.new(2020, 5, 22), location: 'Seoul', status: 'saved', latitude: 37.5665, longitude: 126.9780, user_id: 11)
Trip.create!(start_date: Date.new(2020, 6, 21), end_date: Date.new(2020, 6, 30), location: 'Mumbai', status: 'saved', latitude: 19.0760, longitude: 72.8777, user_id: 11)
Trip.create!(start_date: Date.new(2020, 6, 28), end_date: Date.new(2020, 7, 8), location: 'Mumbai', status: 'saved', latitude: 19.0760, longitude: 72.8777, user_id: 6)

puts "-" * 60
puts "Trips created"
puts "-" * 60
puts "=" * 60
puts "-" * 60
puts "Creating ketchups"
puts "-" * 60

Ketchup.create!(start_date: Date.new(2019, 12, 24), start_time: Time.new(2019, 12, 24, 18, 00, 0), duration: 240, message: 'Meeting with Fanny at a cafe in Met and walking around Central Park on Christams eve', location: 'Petrie Court', status: 'saved', latitude: 40.779091, longitude: -73.964564, user_id: 9, trip_id: 2)
Ketchup.create!(start_date: Date.new(2019, 12, 26), start_time: Time.new(2019, 12, 26, 15, 30, 0), duration: 30, message: 'Short coffee with Avalon to ask some questions about Le Wagon Bootcamp', location: 'Starbucks', status: 'saved', latitude: 41.388799, longitude: 2.171932, user_id: 2, trip_id: 1)
Ketchup.create!(start_date: Date.new(2019, 12, 30), start_time: Time.new(2019, 12, 30, 17, 00, 0), duration: 60, message: 'Catching up with Marin in one of most famous hotels in Mumbai', location: 'The Taj Mahal Palace', status: 'saved', latitude: 18.921717, longitude: 72.833117, user_id: 25, trip_id: 3)
Ketchup.create!(start_date: Date.new(2020, 1, 2), start_time: Time.new(2020, 1, 2, 13, 00, 0), duration: 75, message: 'Decent lunch with Alexander in one of my favorite restaurants in Barcelona', location: 'Hissop', status: 'saved', latitude: 41.394384, longitude: 2.148091, user_id: 3, trip_id: 1)
Ketchup.create!(start_date: Date.new(2020, 1, 2), start_time: Time.new(2020, 1, 2, 20, 30, 0), duration: 90, message: 'Perfect and luxurious restaurant to have dinner and some drinks afterward', location: 'Nuba', status: 'saved', latitude: 41.393353, longitude: 2.135817, user_id: 5, trip_id: 1)
Ketchup.create!(start_date: Date.new(2020, 1, 10), start_time: Time.new(2020, 1, 10, 11, 00, 0), duration: 120, message: 'Early lunch with Cassandre in best restaurant in Mumbai', location: 'Bombay Cantin', status: 'saved', latitude: 19.003244, longitude: 72.827576, user_id: 26, trip_id: 3)
Ketchup.create!(start_date: Date.new(2020, 1, 18), start_time: Time.new(2020, 1, 18, 14, 00, 0), duration: 75, message: 'Late lunch at Italian restaurant in Coney Island', location: 'Gargiulo\'s', status: 'saved', latitude: 40.576508, longitude: -73.982406, user_id: 12, trip_id: 2)
Ketchup.create!(start_date: Date.new(2020, 1, 20), start_time: Time.new(2020, 1, 20, 10, 00, 0), duration: 30, message: 'Short morning coffee near my Airbnb to catch up with Valerie', location: 'Tin Cup Cafe', status: 'saved', latitude: 40.661354, longitude: -73.996859, user_id: 7, trip_id: 2)
Ketchup.create!(start_date: Date.new(2020, 4, 19), start_time: Time.new(2020, 4, 19, 13, 00, 0), duration: 180, message: 'Long lunch at Mexican restaurant in Long Beach', location: 'Tequila Jack\'s Restaurant and Cantina', status: 'saved', latitude: 33.761056, longitude: -118.190132, user_id: 13, trip_id: 4)
Ketchup.create!(start_date: Date.new(2020, 4, 20), start_time: Time.new(2020, 4, 20, 12, 00, 0), duration: 135, message: 'Going to my favorite place in the world and walking around Hollywood', location: 'In-N-Out Burger', status: 'saved', latitude: 34.098220, longitude: -118.341672, user_id: 16, trip_id: 4)
Ketchup.create!(start_date: Date.new(2020, 4, 22), start_time: Time.new(2020, 4, 22, 12, 30, 0), duration: 30, message: 'Quick coffee with Ellyn to just say hi', location: 'Onna Coffee', status: 'saved', latitude: 41.398098, longitude: 2.159659, user_id: 1, trip_id: 5)
Ketchup.create!(start_date: Date.new(2020, 4, 22), start_time: Time.new(2020, 4, 22, 21, 00, 0), duration: 120, message: 'Dinner with Prima at traditional Catalan restaurant', location: 'Goliard', status: 'saved', latitude: 41.399828, longitude: 2.160637, user_id: 4, trip_id: 5)
Ketchup.create!(start_date: Date.new(2020, 4, 24), start_time: Time.new(2020, 4, 24, 15, 00, 0), duration: 60, message: 'Enjoying the sun and walk on the beach', location: 'Platja del Bogatell', status: 'saved', latitude: 41.394380, longitude: 2.206989, user_id: 2, trip_id: 5)
Ketchup.create!(start_date: Date.new(2020, 4, 24), start_time: Time.new(2020, 4, 24, 18, 00, 0), duration: 90, message: 'A hike in the park with my old friend', location: 'Runyon Canyon Park', status: 'saved', latitude: 34.105657, longitude: -118.348687, user_id: 15, trip_id: 4)
Ketchup.create!(start_date: Date.new(2020, 4, 25), start_time: Time.new(2020, 4, 25, 12, 00, 0), duration: 90, message: 'Just chilling at the beach and we might get something to bite', location: 'Venice Beach', status: 'saved', latitude: 33.976975, longitude: -118.466388, user_id: 13, trip_id: 6)
Ketchup.create!(start_date: Date.new(2020, 4, 26), start_time: Time.new(2020, 4, 26, 15, 30, 0), duration: 195, message: 'Hiking in the park with this Hungarian guy with mustache', location: 'Kenneth Hahn Lower Park', status: 'saved', latitude: 34.008955, longitude: -118.369431, user_id: 18, trip_id: 6)
Ketchup.create!(start_date: Date.new(2020, 5, 3), start_time: Time.new(2020, 5, 3, 9, 00, 0), duration: 150, message: 'Morning hike in the mountain located in the middle of Seoul with great view', location: 'Namsan Mountain Park', status: 'saved', latitude: 37.550815, longitude: 126.991211, user_id: 19, trip_id: 7)
Ketchup.create!(start_date: Date.new(2020, 5, 5), start_time: Time.new(2020, 5, 5, 16, 30, 0), duration: 30, message: 'Quick afternoon coffee before my afternoon meeting in Brooklyn', location: 'Starbucks', status: 'saved', latitude: 40.748985, longitude: -73.992362, user_id: 10, trip_id: 8)
Ketchup.create!(start_date: Date.new(2020, 5, 8), start_time: Time.new(2020, 5, 8, 12, 30, 0), duration: 75, message: 'Claire will be my guide to show me around one of the iconic place in the world', location: 'Times square', status: 'saved', latitude: 40.757970, longitude: -73.985549, user_id: 8, trip_id: 8)
Ketchup.create!(start_date: Date.new(2020, 5, 10), start_time: Time.new(2020, 5, 10, 18, 00, 0), duration: 90, message: 'Short dinner to ketchup with my man', location: 'Maple Tree House', status: 'saved', latitude: 37.535047, longitude: 126.993882, user_id: 24, trip_id: 7)
Ketchup.create!(start_date: Date.new(2020, 5, 8), start_time: Time.new(2020, 5, 8, 19, 00, 0), duration: 240, message: 'Long and relaxing dinner at a restaurant with superb view', location: 'Maiella', status: 'saved', latitude: 40.747190, longitude: -73.956690, user_id: 9, trip_id: 8)
Ketchup.create!(start_date: Date.new(2020, 5, 19), start_time: Time.new(2020, 5, 19, 12, 00, 0), duration: 30, message: 'How about having a quick tea?', location: 'Osulloc Tea House', status: 'saved', latitude: 37.574223, longitude: 126.984372, user_id: 21, trip_id: 10)
Ketchup.create!(start_date: Date.new(2020, 5, 19), start_time: Time.new(2020, 5, 19, 19, 30, 0), duration: 60, message: 'Let\'s do some picnic at the park with nice weather', location: 'Yeouido Hangang Park', status: 'saved', latitude: 37.528417, longitude: 126.934250, user_id: 20, trip_id: 10)
Ketchup.create!(start_date: Date.new(2020, 5, 21), start_time: Time.new(2020, 5, 21, 18, 00, 0), duration: 135, message: 'Craving for some Korean meat! Vamos?', location: 'Gombawi', status: 'saved', latitude: 37.510203, longitude: 127.055203, user_id: 23, trip_id: 10)


puts "-" * 60
puts "Ketchups created"
puts "-" * 60

puts "=" * 60
puts "Seeding ended"
puts "*" * 60
