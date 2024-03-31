# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@tacos = Recipe.create!(name: "Tacos", complexity: 2, genre: "Mexican")

@beef = @tacos.ingredients.create!(name: "Ground Beef", cost: 7)
@salt = @tacos.ingredients.create!(name: "Salt", cost: 1)
@tortillas = @tacos.ingredients.create!(name: "Tortillas", cost: 3)
@salsa = @tacos.ingredients.create!(name: "Salsa", cost: 2)
@s_cream = @tacos.ingredients.create!(name: "Sour Cream", cost: 1)