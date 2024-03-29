# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@beef_wellington = Recipe.create!(name: 'Beef Wellington', complexity: 9, genre: "French")
@short_ribs = Recipe.create!(name: 'Braised Short Ribs', complexity: 5, genre: "Spanish")
@tiramisu = Recipe.create!(name: 'Tiramisu', complexity: 10, genre: "Italian")

@salt = @beef_wellington.ingredients.create!(name: 'Salt', cost: 5)
@ground = @beef_wellington.ingredients.create!(name: 'Ground Beef', cost: 30)
@pastry = @beef_wellington.ingredients.create!(name: 'Puff Pastry', cost: 20)

@short_ribs.ingredients.create!(name: 'Short Ribs', cost: 50)
@short_ribs.ingredients.create!(name: 'Red Wine', cost: 35)
@short_ribs.ingredients.create!(name: 'White Onion', cost: 5)

@tiramisu.ingredients.create!(name: 'Coffee Grounds', cost: 15)
@tiramisu.ingredients.create!(name: 'Italian Ice Cream', cost: 20)
@tiramisu.ingredients.create!(name: 'Cake Batter', cost: 17)