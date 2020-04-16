# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "cleaning database"

User.destroy_all
Trip.destroy_all
Ketchup.destroy_all
Notification.destroy_all

puts "creating users"

user = User.new
user.email = Faker::Internet.email
user.password = Faker::Internet.password
user.password_confirmation = user.password
user.home_city = ['Barcelona', 'Los Angeles', 'New York City'].sample
user.save!

puts "users created"
