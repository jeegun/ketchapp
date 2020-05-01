require 'faker'
users_data = [
  {
    email: "ellyn@gmail.com",
    password: "123456",
    first_name: "Ellyn",
    last_name: "Bouscasse",
    home_city: "Sant Cugat del Vallès, Spain",
    latitude: 41.4720702,
    longitude: 2.086515399999999,
    phone_number: "000 000 001",
    lewagon_username: "EllynBsc"
  },
  {
    email: "avalon@gmail.com",
    password: "123456",
    first_name: "Avalon",
    last_name: "van der Horst",
    home_city: "Badalona, Spain",
    latitude: 41.4469883,
    longitude: 2.2450325,
    phone_number: "000 000 002",
    lewagon_username: "Avalonvdhorst"
  },
  {
    email: "alexander@gmail.com",
    password: "123456",
    first_name: "Alexander",
    last_name: "Dubovoy",
    home_city: "Hospitalet de Llobregat, Spain",
    latitude: 41.3661865,
    longitude: 2.1164942,
    phone_number: "000 000 003",
    lewagon_username: "ajdubovoy"
  },
  {
    email: "prima@gmail.com",
    password: "123456",
    first_name: "Prima",
    last_name: "Aulia Gusta",
    home_city: "Barcelona, Spain",
    latitude: 41.38506389999999,
    longitude: 2.1734035,
    phone_number: "000 000 004",
    lewagon_username: "primaulia"
  },
  {
    email: "louise@gmail.com",
    password: "123456",
    first_name: "Louise",
    last_name: "Darche",
    home_city: "Castelldefels, Spain",
    latitude: 41.2800161,
    longitude: 1.9766294,
    phone_number: "000 000 005",
    lewagon_username: "LouiseDarche"
  },
  {
    email: "sangsoo@gmail.com",
    password: "123456",
    first_name: "Sangsoo",
    last_name: "Ra",
    home_city: "Barcelona, Spain",
    latitude: 41.38506389999999,
    longitude: 2.1734035,
    phone_number: "000 000 006",
    lewagon_username: "sangsoora"
  },
  {
    email: "valerie@gmail.com",
    password: "123456",
    first_name: "Valerie",
    last_name: "Schraauwers",
    home_city: "New York City, NY, USA",
    latitude: 40.7127753,
    longitude: -74.0059728,
    phone_number: "000 000 007",
    lewagon_username: "valerieschraauwers"
  },
  {
    email: "claire@gmail.com",
    password: "123456",
    first_name: "Claire",
    last_name: "Gautier",
    home_city: "Fort Lee, NJ, USA",
    latitude: 40.8509333,
    longitude: -73.9701381,
    phone_number: "000 000 008",
    lewagon_username: "claire-gtr"
  },
  {
    email: "fanny@gmail.com",
    password: "123456",
    first_name: "Fanny",
    last_name: "Rojon",
    home_city: "New York, NY, USA",
    latitude: 40.7127753,
    longitude: -74.0059728,
    phone_number: "000 000 009",
    lewagon_username: "fanny-rojon"
  },
  {
    email: "lorenzo@gmail.com",
    password: "123456",
    first_name: "Lorenzo",
    last_name: "Del Castillo Detoeuf",
    home_city: "Hempstead, NY, USA",
    latitude: 40.70621279999999,
    longitude: -73.6187397,
    phone_number: "000 000 010",
    lewagon_username: "ldeld"
  },
  {
    email: "jensen@gmail.com",
    password: "123456",
    first_name: "Jensen",
    last_name: "Daniel",
    home_city: "Yonkers, NY, USA",
    latitude: 40.9312099,
    longitude: -73.89874689999999,
    phone_number: "000 000 011",
    lewagon_username: "jiggyjensen"
  },
  {
    email: "juan@gmail.com",
    password: "123456",
    first_name: "Juan",
    last_name: "Estrella",
    home_city: "Jersey City, NJ, USA",
    latitude: 40.7177545,
    longitude: -74.0431435,
    phone_number: "000 000 012",
    lewagon_username: "TheJuanAndOnly99"
  },
  {
    email: "joyce@gmail.com",
    password: "123456",
    first_name: "Joyce",
    last_name: "Cakmak",
    home_city: "Los Angeles, CA, USA",
    latitude: 34.0522342,
    longitude: -118.2436849,
    phone_number: "000 000 013",
    lewagon_username: "Joyckc"
  },
  {
    email: "jeegun@gmail.com",
    password: "123456",
    first_name: "Jeegun",
    last_name: "Kim",
    home_city: "Anaheim, CA, USA",
    latitude: 33.83659319999999,
    longitude: -117.9143012,
    phone_number: "000 000 014",
    lewagon_username: "jeegun"
  },
  {
    email: "maxime@gmail.com",
    password: "123456",
    first_name: "Maxime",
    last_name: "Geurts",
    home_city: "Long Beach, CA, USA",
    latitude: 33.7700504,
    longitude: -118.1937395,
    phone_number: "000 000 015",
    lewagon_username: "Max51555"
  },
  {
    email: "laura@gmail.com",
    password: "123456",
    first_name: "Laura",
    last_name: "Helmert",
    home_city: "Santa Monica, CA, USA",
    latitude: 34.0194543,
    longitude: -118.4911912,
    phone_number: "000 000 016",
    lewagon_username: "lhelmert"
  },
  {
    email: "robert@gmail.com",
    password: "123456",
    first_name: "Robert",
    last_name: "King",
    home_city: "Carson, CA, USA",
    latitude: 33.8316745,
    longitude: -118.281693,
    phone_number: "000 000 017",
    lewagon_username: "RobOwenKing"
  },
  {
    email: "tamas@gmail.com",
    password: "123456",
    first_name: "Tamas",
    last_name: "Papp",
    home_city: "Los Angeles, CA, USA",
    latitude: 34.0522342,
    longitude: -118.2436849,
    phone_number: "000 000 018",
    lewagon_username: "tomapapp"
  },
  {
    email: "elena@gmail.com",
    password: "123456",
    first_name: "Elena",
    last_name: "Vigo Olivan",
    home_city: "Seoul, South Korea",
    latitude: 37.566535,
    longitude: 126.9779692,
    phone_number: "000 000 019",
    lewagon_username: "elenavigo"
  },
  {
    email: "michael@gmail.com",
    password: "123456",
    first_name: "Michael",
    last_name: "Wlaschitz",
    home_city: "Goyang, Gyeonggi-do, South Korea",
    latitude: 37.6583599,
    longitude: 126.8320201,
    phone_number: "000 000 020",
    lewagon_username: "michaelwlaschitz"
  },
  {
    email: "leon@gmail.com",
    password: "123456",
    first_name: "Leon",
    last_name: "Ellerbrock",
    home_city: "Guri-si, Gyeonggi-do, South Korea",
    latitude: 37.59431240000001,
    longitude: 127.1295646,
    phone_number: "000 000 021",
    lewagon_username: "leonellerbrock"
  },
  {
    email: "raphael@gmail.com",
    password: "123456",
    first_name: "Raphael",
    last_name: "Daverio",
    home_city: "Seoul, South Korea",
    latitude: 37.566535,
    longitude: 126.9779692,
    phone_number: "000 000 022",
    lewagon_username: "raph-dav"
  },
  {
    email: "antoine@gmail.com",
    password: "123456",
    first_name: "Antoine",
    last_name: "De Broqueville",
    home_city: "Bucheon-si, Gyeonggi-do, South Korea",
    latitude: 37.5034138,
    longitude: 126.7660309,
    phone_number: "000 000 023",
    lewagon_username: "Boukto2708"
  },
  {
    email: "ry@gmail.com",
    password: "123456",
    first_name: "Ry",
    last_name: "Ellingson",
    home_city: "Gwacheon, Gyeonggi-do, South Korea",
    latitude: 37.429246,
    longitude: 126.9874451,
    phone_number: "000 000 024",
    lewagon_username: "ryellingson"
  },
  {
    email: "marin@gmail.com",
    password: "123456",
    first_name: "Marin",
    last_name: "Bibot",
    home_city: "Mumbai, Maharashtra, India",
    latitude: 19.0759837,
    longitude: 72.8776559,
    phone_number: "000 000 025",
    lewagon_username: "Marin-b"
  },
  {
    email: "cassandre@gmail.com",
    password: "123456",
    first_name: "Cassandre",
    last_name: "Houzé De L'Aulnoit",
    home_city: "Navi Mumbai, Maharashtra, India",
    latitude: 19.0330488,
    longitude: 73.0296625,
    phone_number: "000 000 026",
    lewagon_username: "CassandreHouze"
  },
  {
    email: "ikram@gmail.com",
    password: "123456",
    first_name: "Ikram",
    last_name: "Akhlaq",
    home_city: "Thane, Maharashtra, India",
    latitude: 19.2183307,
    longitude: 72.9780897,
    phone_number: "000 000 027",
    lewagon_username: "IkramAkhlaq"
  },
  {
    email: "marco@gmail.com",
    password: "123456",
    first_name: "Marco",
    last_name: "De Biolley",
    home_city: "Bhiwandi, Maharashtra, India",
    latitude: 19.2812547,
    longitude: 73.0482912,
    phone_number: "000 000 028",
    lewagon_username: "marcdebiolley"
  },
  {
    email: "emiliano@gmail.com",
    password: "123456",
    first_name: "Emiliano",
    last_name: "Dogaru",
    home_city: "Mumbai, Maharashtra, India",
    latitude: 19.0759837,
    longitude: 72.8776559,
    phone_number: "000 000 029",
    lewagon_username: "dogaruemiliano"
  },
  {
    email: "abder@gmail.com",
    password: "123456",
    first_name: "Aber",
    last_name: "Nadifi",
    home_city: "Dombivli, Maharashtra, India",
    latitude: 19.2094006,
    longitude: 73.0939483,
    phone_number: "000 000 030",
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
Message.destroy_all
puts "Destroyed all messages"
Chat.destroy_all
puts "Destroyed all chats"
Friendship.destroy_all
puts "Destroyed all friendships"
FriendRequest.destroy_all
puts "Destroyed all friend requests"
Ketchup.destroy_all
puts "Destroyed all ketchups"
Trip.destroy_all
puts "Destroyed all trips"
Contact.destroy_all
puts "Destroyed all contacts"
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
puts "Creating contacts"
puts "-" * 60

Contact.create!(user_id: 6, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 009', email: 'fanny@gmail.com')
Contact.create!(user_id: 6, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 007', email: 'valerie@gmail.com')
Contact.create!(user_id: 6, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 008', email: 'claire@gmail.com')
Contact.create!(user_id: 6, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 012', email: 'juan@gmail.com')
Contact.create!(user_id: 6, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 001', email: 'hola@gmail.com')
Contact.create!(user_id: 6, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '111 111 111', email: 'avalon@gmail.com')
Contact.create!(user_id: 6, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 010', email: 'lorenzo@gmail.com')
Contact.create!(user_id: 6, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '444 444 444', email: 'ketchup.app20@gmail.com')
Contact.create!(user_id: 11, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 015', email: 'maxime@gmail.com')
Contact.create!(user_id: 11, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 016', email: 'laura@gmail.com')
Contact.create!(user_id: 11, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 002', email: 'avalon@gmail.com')
Contact.create!(user_id: 11, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 022', email: 'raphael@gmail.com')
Contact.create!(user_id: 11, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 003', email: 'hola@gmail.com')
Contact.create!(user_id: 11, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '222 222 222', email: 'valerie@gmail.com')
Contact.create!(user_id: 11, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 024', email: 'ry@gmail.com')
Contact.create!(user_id: 11, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '555 555 555', email: 'ketchup.app20@gmail.com')
Contact.create!(user_id: 14, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 024', email: 'michael@gmail.com')
Contact.create!(user_id: 14, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 020', email: 'ry@gmail.com')
Contact.create!(user_id: 14, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 019', email: 'elena@gmail.com')
Contact.create!(user_id: 14, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 005', email: 'louise@gmail.com')
Contact.create!(user_id: 14, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 004', email: 'hola@gmail.com')
Contact.create!(user_id: 14, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '333 333 333', email: 'juan@gmail.com')
Contact.create!(user_id: 14, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 013', email: 'joyce@gmail.com')
Contact.create!(user_id: 14, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '666 666 666', email: 'ketchup.app20@gmail.com')
Contact.create!(user_id: 25, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 006', email: 'nadang@gmail.com')
Contact.create!(user_id: 26, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '777 777 777', email: 'sangsoo@gmail.com')
Contact.create!(user_id: 26, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 011', email: 'jiggy@gmail.com')
Contact.create!(user_id: 25, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '888 888 888', email: 'jensen@gmail.com')
Contact.create!(user_id: 25, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 014', email: 'gunman@gmail.com')
Contact.create!(user_id: 26, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '999 999 999', email: 'jeegun@gmail.com')

puts "-" * 60
puts "Contacts created"
puts "-" * 60
puts "=" * 60
puts "-" * 60
puts "Creating trips"
puts "-" * 60

Trip.create!(start_date: Date.new(2019, 12, 21), end_date: Date.new(2020, 1, 4), location: 'Barcelona', status: 'confirmed', latitude: 41.3851, longitude: 2.1734, user_id: 11)
Trip.create!(start_date: Date.new(2019, 12, 18), end_date: Date.new(2020, 1, 23), location: 'New York City', status: 'confirmed', latitude: 40.7128, longitude: -74.0060, user_id: 6)
Trip.create!(start_date: Date.new(2019, 12, 29), end_date: Date.new(2020, 1, 12), location: 'Mumbai', status: 'confirmed', latitude: 19.0760, longitude: 72.8777, user_id: 14)
Trip.create!(start_date: Date.new(2020, 2, 2), end_date: Date.new(2020, 2, 9), location: 'Los Angeles', status: 'confirmed', latitude: 34.0522, longitude: -118.2437, user_id: 6)
Trip.create!(start_date: Date.new(2020, 2, 8), end_date: Date.new(2020, 2, 19), location: 'Barcelona', status: 'confirmed', latitude: 41.3851, longitude: 2.1734, user_id: 14)
Trip.create!(start_date: Date.new(2020, 2, 20), end_date: Date.new(2020, 2, 25), location: 'Seoul', status: 'confirmed', latitude: 37.5665, longitude: 126.9780, user_id: 11)
Trip.create!(start_date: Date.new(2020, 2, 28), end_date: Date.new(2020, 3, 12), location: 'New York City', status: 'confirmed', latitude: 40.7128, longitude: -74.0060, user_id: 14)
Trip.create!(start_date: Date.new(2020, 3, 19), end_date: Date.new(2020, 3, 30), location: 'Barcelona', status: 'confirmed', latitude: 41.3851, longitude: 2.1734, user_id: 11)
Trip.create!(start_date: Date.new(2020, 3, 28), end_date: Date.new(2020, 4, 8), location: 'Seoul', status: 'confirmed', latitude: 37.5665, longitude: 126.9780, user_id: 6)
Trip.create!(start_date: Date.new(2020, 4, 18), end_date: Date.new(2020, 4, 28), location: 'Los Angeles', status: 'confirmed', latitude: 34.0522, longitude: -118.2437, user_id: 6)
Trip.create!(start_date: Date.new(2020, 4, 20), end_date: Date.new(2020, 4, 25), location: 'Barcelona', status: 'confirmed', latitude: 41.3851, longitude: 2.1734, user_id: 14)
Trip.create!(start_date: Date.new(2020, 4, 21), end_date: Date.new(2020, 4, 29), location: 'Los Angeles', status: 'confirmed', latitude: 34.0522, longitude: -118.2437, user_id: 11)
Trip.create!(start_date: Date.new(2020, 5, 2), end_date: Date.new(2020, 5, 13), location: 'Seoul', status: 'saved', latitude: 37.5665, longitude: 126.9780, user_id: 6)
Trip.create!(start_date: Date.new(2020, 5, 2), end_date: Date.new(2020, 5, 9), location: 'New York City', status: 'saved', latitude: 40.7128, longitude: -74.0060, user_id: 14)
Trip.create!(start_date: Date.new(2020, 5, 10), end_date: Date.new(2020, 6, 2), location: 'Seoul', status: 'saved', latitude: 37.5665, longitude: 126.9780, user_id: 14)
Trip.create!(start_date: Date.new(2020, 5, 18), end_date: Date.new(2020, 5, 22), location: 'Seoul', status: 'saved', latitude: 37.5665, longitude: 126.9780, user_id: 11)
Trip.create!(start_date: Date.new(2020, 6, 21), end_date: Date.new(2020, 6, 30), location: 'Mumbai', status: 'saved', latitude: 19.0760, longitude: 72.8777, user_id: 11)
Trip.create!(start_date: Date.new(2020, 6, 28), end_date: Date.new(2020, 7, 8), location: 'Mumbai', status: 'saved', latitude: 19.0760, longitude: 72.8777, user_id: 6)
Trip.create!(start_date: Date.new(2020, 7, 2), end_date: Date.new(2020, 7, 9), location: 'New York City', status: 'confirmed', latitude: 40.7128, longitude: -74.0060, user_id: 15)
Trip.create!(start_date: Date.new(2020, 7, 2), end_date: Date.new(2020, 7, 13), location: 'New York City', status: 'confirmed', latitude: 40.7128, longitude: -74.0060, user_id: 2)
Trip.create!(start_date: Date.new(2020, 7, 10), end_date: Date.new(2020, 8, 2), location: 'Barcelona', status: 'confirmed', latitude: 41.3851, longitude: 2.1734, user_id: 19)
Trip.create!(start_date: Date.new(2020, 7, 18), end_date: Date.new(2020, 7, 22), location: 'Barcelona', status: 'confirmed', latitude: 41.3851, longitude: 2.1734, user_id: 12)
Trip.create!(start_date: Date.new(2020, 7, 21), end_date: Date.new(2020, 7, 30), location: 'Los Angeles', status: 'confirmed', latitude: 34.0522, longitude: -118.2437, user_id: 5)
Trip.create!(start_date: Date.new(2020, 7, 28), end_date: Date.new(2020, 8, 8), location: 'Los Angeles', status: 'confirmed', latitude: 34.0522, longitude: -118.2437, user_id: 7)

puts "-" * 60
puts "Trips created"
puts "-" * 60
puts "=" * 60
puts "-" * 60
puts "Creating ketchups"
puts "-" * 60

Ketchup.create!(start_date: DateTime.new(2019, 12, 24, 18, 00, 0), end_date: DateTime.new(2019, 12, 24, 22, 00, 0), message: 'Meeting with Fanny at a cafe in Met and walking around Central Park on Christams eve', location: 'Petrie Court', status: 'confirmed', latitude: 40.779091, longitude: -73.964564, user_id: 9, trip_id: 2)
Ketchup.create!(start_date: DateTime.new(2019, 12, 26, 15, 30, 0), end_date: DateTime.new(2019, 12, 26, 16, 00, 0), message: 'Short coffee with Avalon to ask some questions about Le Wagon Bootcamp', location: 'Starbucks', status: 'confirmed', latitude: 41.388799, longitude: 2.171932, user_id: 2, trip_id: 1)
Ketchup.create!(start_date: DateTime.new(2019, 12, 30, 17, 00, 0), end_date: DateTime.new(2019, 12, 30, 18, 00, 0), message: 'Catching up with Marin in one of most famous hotels in Mumbai', location: 'The Taj Mahal Palace', status: 'confirmed', latitude: 18.921717, longitude: 72.833117, user_id: 25, trip_id: 3)
Ketchup.create!(start_date: DateTime.new(2020, 1, 2, 13, 00, 0), end_date: DateTime.new(2020, 1, 2, 14, 15, 0), message: 'Decent lunch with Alexander in one of my favorite restaurants in Barcelona', location: 'Hissop', status: 'confirmed', latitude: 41.394384, longitude: 2.148091, user_id: 3, trip_id: 1)
Ketchup.create!(start_date: DateTime.new(2020, 1, 2, 20, 30, 0), end_date: DateTime.new(2020, 1, 2, 22, 00, 0), message: 'Perfect and luxurious restaurant to have dinner and some drinks afterward', location: 'Nuba', status: 'confirmed', latitude: 41.393353, longitude: 2.135817, user_id: 5, trip_id: 1)
Ketchup.create!(start_date: DateTime.new(2020, 1, 10, 11, 00, 0), end_date: DateTime.new(2020, 1, 10, 13, 00, 0), message: 'Early lunch with Cassandre in best restaurant in Mumbai', location: 'Bombay Cantin', status: 'confirmed', latitude: 19.003244, longitude: 72.827576, user_id: 26, trip_id: 3)
Ketchup.create!(start_date: DateTime.new(2020, 1, 18, 14, 00, 0), end_date: DateTime.new(2020, 1, 18, 15, 15, 0), message: 'Late lunch at Italian restaurant in Coney Island', location: 'Gargiulo\'s', status: 'confirmed', latitude: 40.576508, longitude: -73.982406, user_id: 12, trip_id: 2)
Ketchup.create!(start_date: DateTime.new(2020, 1, 20, 10, 00, 0), end_date: DateTime.new(2020, 1, 20, 10, 30, 0), message: 'Short morning coffee near my Airbnb to catch up with Valerie', location: 'Tin Cup Cafe', status: 'confirmed', latitude: 40.661354, longitude: -73.996859, user_id: 7, trip_id: 2)
Ketchup.create!(start_date: DateTime.new(2020, 2, 22, 12, 00, 0), end_date: DateTime.new(2020, 2, 22, 12, 30, 0), message: 'How about having a quick tea?', location: 'Osulloc Tea House', status: 'pending', latitude: 37.574223, longitude: 126.984372, user_id: 21, trip_id: 6)
Ketchup.create!(start_date: DateTime.new(2020, 2, 22, 19, 30, 0), end_date: DateTime.new(2020, 2, 22, 20, 30, 0), message: 'Let\'s do some picnic at the park with nice weather', location: 'Yeouido Hangang Park', status: 'pending', latitude: 37.528417, longitude: 126.934250, user_id: 20, trip_id: 6)
Ketchup.create!(start_date: DateTime.new(2020, 2, 24, 18, 00, 0), end_date: DateTime.new(2020, 5, 24, 20, 15, 0), message: 'Craving for some Korean meat! Vamos?', location: 'Gombawi', status: 'pending', latitude: 37.510203, longitude: 127.055203, user_id: 23, trip_id: 6)
Ketchup.create!(start_date: DateTime.new(2020, 3, 1, 16, 30, 0), end_date: DateTime.new(2020, 3, 1, 17, 00, 0), message: 'Quick afternoon coffee before my afternoon meeting in Brooklyn', location: 'Starbucks', status: 'pending', latitude: 40.748985, longitude: -73.992362, user_id: 10, trip_id: 7)
Ketchup.create!(start_date: DateTime.new(2020, 3, 8, 12, 30, 0), end_date: DateTime.new(2020, 3, 8, 13, 45, 0), message: 'Claire will be my guide to show me around one of the iconic place in the world', location: 'Times square', status: 'pending', latitude: 40.757970, longitude: -73.985549, user_id: 8, trip_id: 7)
Ketchup.create!(start_date: DateTime.new(2020, 3, 8, 19, 00, 0), end_date: DateTime.new(2020, 3, 8, 23, 00, 0), message: 'Long and relaxing dinner at a restaurant with superb view', location: 'Maiella', status: 'pending', latitude: 40.747190, longitude: -73.956690, user_id: 9, trip_id: 7)
Ketchup.create!(start_date: DateTime.new(2020, 3, 29, 9, 00, 0), end_date: DateTime.new(2020, 3, 29, 11, 30, 0), message: 'Morning hike in the mountain located in the middle of Seoul with great view', location: 'Namsan Mountain Park', status: 'confirmed', latitude: 37.550815, longitude: 126.991211, user_id: 19, trip_id: 9)
Ketchup.create!(start_date: DateTime.new(2020, 4, 1, 18, 00, 0), end_date: DateTime.new(2020, 4, 1, 19, 30, 0), message: 'Short dinner to ketchup with my man', location: 'Maple Tree House', status: 'confirmed', latitude: 37.535047, longitude: 126.993882, user_id: 24, trip_id: 9)
Ketchup.create!(start_date: DateTime.new(2020, 4, 19, 13, 00, 0), end_date: DateTime.new(2020, 4, 19, 16, 00, 0), message: 'Long lunch at Mexican restaurant in Long Beach', location: 'Tequila Jack\'s Restaurant and Cantina', status: 'confirmed', latitude: 33.761056, longitude: -118.190132, user_id: 13, trip_id: 10)
Ketchup.create!(start_date: DateTime.new(2020, 4, 20, 12, 00, 0), end_date: DateTime.new(2020, 4, 20, 14, 15, 0), message: 'Going to my favorite place in the world and walking around Hollywood', location: 'In-N-Out Burger', status: 'confirmed', latitude: 34.098220, longitude: -118.341672, user_id: 16, trip_id: 10)
Ketchup.create!(start_date: DateTime.new(2020, 4, 22, 12, 30, 0), end_date: DateTime.new(2020, 4, 22, 13, 00, 0), message: 'Quick coffee with Ellyn to just say hi', location: 'Onna Coffee', status: 'confirmed', latitude: 41.398098, longitude: 2.159659, user_id: 1, trip_id: 11)
Ketchup.create!(start_date: DateTime.new(2020, 4, 22, 21, 00, 0), end_date: DateTime.new(2020, 4, 22, 23, 00, 0), message: 'Dinner with Prima at traditional Catalan restaurant', location: 'Goliard', status: 'confirmed', latitude: 41.399828, longitude: 2.160637, user_id: 4, trip_id: 11)
Ketchup.create!(start_date: DateTime.new(2020, 4, 24, 15, 00, 0), end_date: DateTime.new(2020, 4, 24, 16, 00, 0), message: 'Enjoying the sun and walk on the beach', location: 'Platja del Bogatell', status: 'pending', latitude: 41.394380, longitude: 2.206989, user_id: 2, trip_id: 11)
Ketchup.create!(start_date: DateTime.new(2020, 4, 24, 18, 00, 0), end_date: DateTime.new(2020, 4, 24, 19, 30, 0), message: 'A hike in the park with my old friend', location: 'Runyon Canyon Park', status: 'pending', latitude: 34.105657, longitude: -118.348687, user_id: 15, trip_id: 10)
Ketchup.create!(start_date: DateTime.new(2020, 4, 25, 12, 00, 0), end_date: DateTime.new(2020, 4, 25, 13, 30, 0), message: 'Just chilling at the beach and we might get something to bite', location: 'Venice Beach', status: 'confirmed', latitude: 33.976975, longitude: -118.466388, user_id: 13, trip_id: 12)
Ketchup.create!(start_date: DateTime.new(2020, 4, 26, 15, 30, 0), end_date: DateTime.new(2020, 4, 26, 18, 45, 0), message: 'Hiking in the park with this Hungarian guy with mustache', location: 'Kenneth Hahn Lower Park', status: 'pending', latitude: 34.008955, longitude: -118.369431, user_id: 18, trip_id: 12)
Ketchup.create!(start_date: DateTime.new(2020, 7, 3, 18, 00, 0), end_date: DateTime.new(2020, 7, 3, 21, 00, 0), message: 'Let\'s catch up and some nice meat!', location: 'The Capital Grille - Curbside Takeout & Delivery', status: 'confirmed', latitude: 40.751155, longitude: -73.974895, user_id: 11, trip_id: 19)
Ketchup.create!(start_date: DateTime.new(2020, 7, 5, 12, 00, 0), end_date: DateTime.new(2020, 7, 5, 12, 30, 0), message: 'How about one more coffee?', location: 'Blue Bottle Coffee', status: 'pending', latitude: 40.753063, longitude: -73.984136, user_id: 11, trip_id: 19)
Ketchup.create!(start_date: DateTime.new(2020, 7, 9, 12, 00, 0), end_date: DateTime.new(2020, 7, 9, 17, 00, 0), message: 'Can you show me around the famous Statue of Liberty?', location: 'Statue of Liberty National Monument', status: 'confirmed', latitude: 40.689376, longitude: -74.044628, user_id: 11, trip_id: 20)
Ketchup.create!(start_date: DateTime.new(2020, 7, 12, 10, 30, 0), end_date: DateTime.new(2020, 7, 12, 11, 30, 0), message: 'Craving for some nice bagel and coffee!', location: 'Ess-a-Bagel', status: 'pending', latitude: 40.756193, longitude: -73.970294, user_id: 11, trip_id: 20)
Ketchup.create!(start_date: DateTime.new(2020, 7, 13, 21, 00, 0), end_date: DateTime.new(2020, 7, 14, 01, 00, 0), message: 'Want some good tapas and nice wine to enjoy the evening!', location: 'El Nacional', status: 'confirmed', latitude: 41.390207, longitude: 2.167891, user_id: 6, trip_id: 21)
Ketchup.create!(start_date: DateTime.new(2020, 7, 17, 16, 00, 0), end_date: DateTime.new(2020, 7, 17, 18, 00, 0), message: 'Need to do some shopping and can you help me?', location: 'L\'illa Diagonal', status: 'pending', latitude: 41.389829, longitude: 2.135075, user_id: 6, trip_id: 21)
Ketchup.create!(start_date: DateTime.new(2020, 7, 19, 22, 00, 0), end_date: DateTime.new(2020, 7, 20, 00, 00, 0), message: 'Wanna grab some beers and say hi?', location: '4 Latas - Muntaner', status: 'confirmed', latitude: 41.393401, longitude: 2.150272, user_id: 6, trip_id: 22)
Ketchup.create!(start_date: DateTime.new(2020, 7, 21, 20, 00, 0), end_date: DateTime.new(2020, 7, 21, 23, 30, 0), message: 'Can you take me to Barca match? Tickets are on me!', location: 'Camp Nou', status: 'pending', latitude: 41.380606, longitude: 2.123056, user_id: 6, trip_id: 22)
Ketchup.create!(start_date: DateTime.new(2020, 7, 23, 14, 00, 0), end_date: DateTime.new(2020, 7, 23, 18, 00, 0), message: 'Heard Giants are playing Dodgers! Wanna watch how Giants bit the shit out of Dodgers!', location: 'Dodger Stadium', status: 'confirmed', latitude: 34.073620, longitude: -118.239894, user_id: 14, trip_id: 23)
Ketchup.create!(start_date: DateTime.new(2020, 7, 27, 12, 00, 0), end_date: DateTime.new(2020, 7, 27, 15, 30, 0), message: 'Can you have a walk with me and show around? ', location: 'Hollywood Walk of Fame', status: 'pending', latitude: 34.101543, longitude: -118.326872, user_id: 14, trip_id: 23)
Ketchup.create!(start_date: DateTime.new(2020, 7, 30, 19, 00, 0), end_date: DateTime.new(2020, 7, 30, 22, 00, 0), message: 'J.Lo is coming to Staples Center. Can you please take me there?', location: 'STAPLES Center', status: 'confirmed', latitude: 34.042916, longitude: -118.267323, user_id: 14, trip_id: 24)
Ketchup.create!(start_date: DateTime.new(2020, 8, 1, 18, 00, 0), end_date: DateTime.new(2020, 8, 1, 20, 00, 0), message: 'Heard this place is quite nice! Want some Korean BBQ with me?', location: 'Dream Korean BBQ', status: 'pending', latitude: 34.073582, longitude: -118.308654, user_id: 14, trip_id: 24)

puts "-" * 60
puts "Ketchups created"
puts "-" * 60
puts "=" * 60
puts "-" * 60
puts "Creating friend requests"
puts "-" * 60

FriendRequest.create!(sender_id: 6, receiver_id: 8, status: 'pending')
FriendRequest.create!(sender_id: 12, receiver_id: 6, status: 'pending')
FriendRequest.create!(sender_id: 6, receiver_id: 15, status: 'pending')
FriendRequest.create!(sender_id: 18, receiver_id: 6, status: 'pending')
FriendRequest.create!(sender_id: 6, receiver_id: 24, status: 'pending')
FriendRequest.create!(sender_id: 23, receiver_id: 6, status: 'pending')
FriendRequest.create!(sender_id: 11, receiver_id: 2, status: 'pending')
FriendRequest.create!(sender_id: 5, receiver_id: 11, status: 'pending')
FriendRequest.create!(sender_id: 11, receiver_id: 17, status: 'pending')
FriendRequest.create!(sender_id: 13, receiver_id: 11, status: 'pending')
FriendRequest.create!(sender_id: 11, receiver_id: 20, status: 'pending')
FriendRequest.create!(sender_id: 22, receiver_id: 11, status: 'pending')
FriendRequest.create!(sender_id: 14, receiver_id: 3, status: 'pending')
FriendRequest.create!(sender_id: 5, receiver_id: 14, status: 'pending')
FriendRequest.create!(sender_id: 14, receiver_id: 7, status: 'pending')
FriendRequest.create!(sender_id: 9, receiver_id: 14, status: 'pending')
FriendRequest.create!(sender_id: 14, receiver_id: 19, status: 'pending')
FriendRequest.create!(sender_id: 21, receiver_id: 14, status: 'pending')

puts "-" * 60
puts "Friend requests created"
puts "-" * 60
puts "=" * 60
puts "-" * 60
puts "Creating friendships"
puts "-" * 60

Friendship.create!(friend_sender_id: 9, friend_receiver_id: 6)
Friendship.create!(friend_sender_id: 6, friend_receiver_id: 7)
Friendship.create!(friend_sender_id: 13, friend_receiver_id: 6)
Friendship.create!(friend_sender_id: 6, friend_receiver_id: 16)
Friendship.create!(friend_sender_id: 19, friend_receiver_id: 6)
Friendship.create!(friend_sender_id: 6, friend_receiver_id: 22)
Friendship.create!(friend_sender_id: 1, friend_receiver_id: 11)
Friendship.create!(friend_sender_id: 11, friend_receiver_id: 4)
Friendship.create!(friend_sender_id: 16, friend_receiver_id: 11)
Friendship.create!(friend_sender_id: 11, friend_receiver_id: 15)
Friendship.create!(friend_sender_id: 21, friend_receiver_id: 11)
Friendship.create!(friend_sender_id: 11, friend_receiver_id: 23)
Friendship.create!(friend_sender_id: 2, friend_receiver_id: 14)
Friendship.create!(friend_sender_id: 14, friend_receiver_id: 1)
Friendship.create!(friend_sender_id: 8, friend_receiver_id: 14)
Friendship.create!(friend_sender_id: 14, friend_receiver_id: 10)
Friendship.create!(friend_sender_id: 24, friend_receiver_id: 14)
Friendship.create!(friend_sender_id: 14, friend_receiver_id: 20)

puts "-" * 60
puts "Friendships created"
puts "-" * 60
puts "=" * 60
puts "-" * 60
puts "Creating notifications"
puts "-" * 60

Notification.create!(recipient_id: 6, actor_id: 12, action: 'sent you a', notifiable_id: 2, notifiable_type: 'FriendRequest')
Notification.create!(recipient_id: 6, actor_id: 18, action: 'sent you a', notifiable_id: 4, notifiable_type: 'FriendRequest')
Notification.create!(recipient_id: 6, actor_id: 23, action: 'sent you a', notifiable_id: 6, notifiable_type: 'FriendRequest')
Notification.create!(recipient_id: 11, actor_id: 5, action: 'sent you a', notifiable_id: 8, notifiable_type: 'FriendRequest')
Notification.create!(recipient_id: 11, actor_id: 13, action: 'sent you a', notifiable_id: 10, notifiable_type: 'FriendRequest')
Notification.create!(recipient_id: 11, actor_id: 22, action: 'sent you a', notifiable_id: 12, notifiable_type: 'FriendRequest')
Notification.create!(recipient_id: 14, actor_id: 5, action: 'sent you a', notifiable_id: 14, notifiable_type: 'FriendRequest')
Notification.create!(recipient_id: 14, actor_id: 9, action: 'sent you a', notifiable_id: 16, notifiable_type: 'FriendRequest')
Notification.create!(recipient_id: 14, actor_id: 21, action: 'sent you a', notifiable_id: 18, notifiable_type: 'FriendRequest')
Notification.create!(recipient_id: 6, actor_id: 7, action: 'has accepted your', notifiable_id: 2, notifiable_type: 'Friendship')
Notification.create!(recipient_id: 6, actor_id: 16, action: 'has accepted your', notifiable_id: 4, notifiable_type: 'Friendship')
Notification.create!(recipient_id: 6, actor_id: 22, action: 'has accepted your', notifiable_id: 6, notifiable_type: 'Friendship')
Notification.create!(recipient_id: 11, actor_id: 4, action: 'has accepted your', notifiable_id: 8, notifiable_type: 'Friendship')
Notification.create!(recipient_id: 11, actor_id: 15, action: 'has accepted your', notifiable_id: 10, notifiable_type: 'Friendship')
Notification.create!(recipient_id: 11, actor_id: 23, action: 'has accepted your', notifiable_id: 12, notifiable_type: 'Friendship')
Notification.create!(recipient_id: 14, actor_id: 1, action: 'has accepted your', notifiable_id: 14, notifiable_type: 'Friendship')
Notification.create!(recipient_id: 14, actor_id: 10, action: 'has accepted your', notifiable_id: 16, notifiable_type: 'Friendship')
Notification.create!(recipient_id: 14, actor_id: 20, action: 'has accepted your', notifiable_id: 18, notifiable_type: 'Friendship')


puts "-" * 60
puts "Notifications created"
puts "-" * 60

puts "=" * 60
puts "Seeding ended"
puts "*" * 60
