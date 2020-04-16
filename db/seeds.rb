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
    email: "valerie@gmail.com",
    password: "123456",
    first_name: "Valerie",
    last_name: "Schraauwers",
    home_city: "Barcelona",
    latitude: 41.3851,
    longitude: 2.1734,
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
    longitude: 74.0060,
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
    longitude: 74.0060,
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
    longitude: 74.0060,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "ldeld"
  },

  {
    email: "sang@gmail.com",
    password: "123456",
    first_name: "Sangsoo",
    last_name: "Ra",
    home_city: "New York City",
    latitude: 40.7128,
    longitude: 74.0060,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "sangsoora"
  },
  {
    email: "jeegun@gmail.com",
    password: "123456",
    first_name: "Jeegun",
    last_name: "Kim",
    home_city: "New York City",
    latitude: 40.7128,
    longitude: 74.0060,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "jeegun"
  },

  {
    email: "jensen@gmail.com",
    password: "123456",
    first_name: "Jensen",
    last_name: "Daniel",
    home_city: "New York City",
    latitude: 40.7128,
    longitude: 74.0060,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "jiggyjensen"
  },

  {
    email: "joyce@gmail.com",
    password: "123456",
    first_name: "Joyce",
    last_name: "Cakmak",
    home_city: "Los Angeles",
    latitude: 34.0522,
    longitude: 118.2437,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "Joyckc"
  },

  {
    email: "juan@gmail.com",
    password: "123456",
    first_name: "Juan",
    last_name: "Estrella",
    home_city: "Los Angeles",
    latitude: 34.0522,
    longitude: 118.2437,
    phone_number: Faker::PhoneNumber.phone_number,
    lewagon_username: "TheJuanAndOnly99"
  },

  {
    email: "maxime@gmail.com",
    password: "123456",
    first_name: "Maxime",
    last_name: "Geurts",
    home_city: "Los Angeles",
    latitude: 34.0522,
    longitude: 118.2437,
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
    longitude: 118.2437,
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
    longitude: 118.2437,
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
    longitude: 118.2437,
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
    last_name: "Ellerbrock",
    home_city: "Bibot",
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


puts "cleaning database"

User.destroy_all
Trip.destroy_all
Ketchup.destroy_all
Notification.destroy_all

puts "creating users"

users_data.each do |user_data|
  user = User.create!(user_data)
end

puts "users created"
