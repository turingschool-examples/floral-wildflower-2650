# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@ingre_1 = Ingredient.create!(name: "salt", cost: 1)
@ingre_2 = Ingredient.create!(name: "ziti", cost: 5)
@ingre_3 = Ingredient.create!(name: "tomato", cost: 3)
@ingre_4 = Ingredient.create!(name: "olive oil", cost: 10)
@ingre_5 = Ingredient.create!(name: "water", cost: 0)

@ez_ziti = Recipe.create!(name: "EZ ziti", complexity: 1, genre: "Italian")

@ez_ziti_ingres_1 = RecipeIngredient.create!(ingredient_id: @ingre_1.id, recipe_id: @ez_ziti.id)
@ez_ziti_ingres_2 = RecipeIngredient.create!(ingredient_id: @ingre_2.id, recipe_id: @ez_ziti.id)
@ez_ziti_ingres_3 = RecipeIngredient.create!(ingredient_id: @ingre_3.id, recipe_id: @ez_ziti.id)
@ez_ziti_ingres_4 = RecipeIngredient.create!(ingredient_id: @ingre_4.id, recipe_id: @ez_ziti.id)