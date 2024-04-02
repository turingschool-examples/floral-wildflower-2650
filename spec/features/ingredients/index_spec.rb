require 'rails_helper'

RSpec.describe 'Ingredients Index Page' do
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

  describe 'User story 1' do
    it 'displays all ingredients with their name and cost' do
      visit "/ingredients"
      
      expect(page).to have_content(@tomato.name)
      expect(page).to have_content(@tomato.cost)
      expect(page).to have_content(@onion.name)
      expect(page).to have_content(@onion.cost)
      expect(page).to have_content(@garlic.name)
      expect(page).to have_content(@garlic.cost)
    end
  end
  
  describe 'Extension 1' do
    it 'sorts the ingredients alphabetically' do
      visit "/ingredients"

      expect(@garlic.name).to appear_before(@onion.name)
      expect(@onion.name).to appear_before(@tomato.name)
      expect(@tomato.name).to_not appear_before(@garlic.name)
    end
  end
end