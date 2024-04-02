# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seeds.rb
spaghetti_bolognese = Recipe.create!(name: "Spaghetti Bolognese", complexity: 3, genre: "Italian")
tacos = Recipe.create!(name: "Tacos", complexity: 4, genre: "Mexican")
chicken_curry = Recipe.create!(name: "Chicken Curry", complexity: 2, genre: "Indian")

tomato = Ingredient.create!(name: "Tomato", cost: 2)
onion = Ingredient.create!(name: "Onion", cost: 1.5)
garlic = Ingredient.create!(name: "Garlic", cost: 1)

RecipeIngredient.create!(recipe: spaghetti_bolognese, ingredient: tomato)
RecipeIngredient.create!(recipe: spaghetti_bolognese, ingredient: onion)
RecipeIngredient.create!(recipe: spaghetti_bolognese, ingredient: garlic)

RecipeIngredient.create!(recipe: tacos, ingredient: tomato)
RecipeIngredient.create!(recipe: tacos, ingredient: onion)
RecipeIngredient.create!(recipe: tacos, ingredient: garlic)

RecipeIngredient.create!(recipe: chicken_curry, ingredient: tomato)
RecipeIngredient.create!(recipe: chicken_curry, ingredient: onion)
RecipeIngredient.create!(recipe: chicken_curry, ingredient: garlic)
