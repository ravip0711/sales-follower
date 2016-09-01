# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "home@home.com", password: "1234567")

Store.create(name: "Express")
Store.create(name: "Guess")
Store.create(name: "H&M")
Store.create(name: "Forever 21")
