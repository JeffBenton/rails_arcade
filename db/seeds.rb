# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Game.destroy_all
Manufacturer.destroy_all
Play.destroy_all

def create_user
  User.create(name: Faker::Name.name, password_digest: "asdf", tokens: rand(50..100))
end

def create_game(manufacturer)
  Game.create(name: Faker::Game.title, token_cost: rand(10..20), manufacturer_id: manufacturer.id)
end

def create_manufacturer
  Manufacturer.create(name: Faker::Company.name)
end

def create_play(user, game, quantity=1)
  Play.create(user_id: user.id, game_id: game.id, quantity: quantity)
end

users = []
games = []
manufacturers = []
(1..2).each do
  manufacturers << create_manufacturer
end
(1..5).each do
  users << create_user
  games << create_game(manufacturers[rand(0..1)])
end
