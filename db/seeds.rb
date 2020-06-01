# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Abdel Pérez", email: "perezpy@gmail.com",
  password: "123456", password_confirmation: "123456")

User.create!(name: "Martin Njoroge", email: "example@rails.com",
  password: "123456", password_confirmation: "123456")

User.create!(name: "Susan Cho", email: "examp@girls.com",
  password: "123456", password_confirmation: "123456")

User.create!(name: "Ivan Diaz", email: "ivan@rails.com",
  password: "123456", password_confirmation: "123456")

User.first.posts.create(content: "Post1")