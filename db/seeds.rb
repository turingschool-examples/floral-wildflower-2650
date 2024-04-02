# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Recipes will have a name, complexity and genre. For example Pasta, 2 (integer), Italian.

# Ingredients will have a name and a cost stored as an integer.

print "Creating Ingredients"
sleep(1)
Ingredient.create!(name: "Ground Beef", cost: 6)
Ingredient.create!(name: "Onion", cost: 2)
Ingredient.create!(name: "Red Bell Pepper", cost: 1)
Ingredient.create!(name: "Salt", cost: 2)
Ingredient.create!(name: "Bread", cost: 3)
puts " - Done"