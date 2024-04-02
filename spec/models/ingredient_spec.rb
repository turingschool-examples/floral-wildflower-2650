require "rails_helper"

RSpec.describe Ingredient, type: :model do
   before :each do
      @spaghetti_bolognese = Recipe.create!(name: "Spaghetti Bolognese", complexity: 3, genre: "Italian")
      @tacos = Recipe.create!(name: "Tacos", complexity: 4, genre: "Mexican")
      @chicken_curry = Recipe.create!(name: "Chicken Curry", complexity: 2, genre: "Indian")

      @tomato = Ingredient.create!(name: "Tomato", cost: 2)
      @onion = Ingredient.create!(name: "Onion", cost: 1.5)
      @garlic = Ingredient.create!(name: "Garlic", cost: 1)

      RecipeIngredient.create!(recipe: @spaghetti_bolognese, ingredient: @tomato)
      RecipeIngredient.create!(recipe: @spaghetti_bolognese, ingredient: @onion)
      RecipeIngredient.create!(recipe: @spaghetti_bolognese, ingredient: @garlic)

      RecipeIngredient.create!(recipe: @tacos, ingredient: @tomato)
      RecipeIngredient.create!(recipe: @tacos, ingredient: @onion)
      RecipeIngredient.create!(recipe: @tacos, ingredient: @garlic)

      RecipeIngredient.create!(recipe: @chicken_curry, ingredient: @tomato)
      RecipeIngredient.create!(recipe: @chicken_curry, ingredient: @onion)
      RecipeIngredient.create!(recipe: @chicken_curry, ingredient: @garlic)
   end

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   it "#sort_alphabetically" do
      all_ingredients = Ingredient.all

      expect(all_ingredients.sort_alphabetically).to eq([@garlic, @onion, @tomato])
   end

end