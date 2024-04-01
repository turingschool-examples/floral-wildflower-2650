# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
spaghetti_with_meat_sauce = Recipe.create!(name: "Spaghetti with Meat Sauce", complexity: 3, genre: "Italian")
spaghetti_with_meat_sauce.ingredients.create!(name: "Tomatoes", cost: 4)
spaghetti_with_meat_sauce.ingredients.create!(name: "Spaghetti", cost: 5)
spaghetti_with_meat_sauce.ingredients.create!(name: "Ground Beef", cost: 10)
spaghetti_with_meat_sauce.ingredients.create!(name: "Basil", cost: 1)