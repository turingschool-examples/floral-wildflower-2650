require 'rails_helper'

RSpec.describe 'Recipe Show Page' do
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

  describe 'User Story 2' do
    it 'has a recipes complexity, name, and genre' do
      visit "/recipes/#{@spaghetti_bolognese.id}"

      expect(page).to have_content(@spaghetti_bolognese.name)
      expect(page).to have_content(@spaghetti_bolognese.complexity)
      expect(page).to have_content(@spaghetti_bolognese.genre) 
    end

    it 'lists the names of all the ingredients for the recipe' do
      visit "/recipes/#{@spaghetti_bolognese.id}"

      expect(page).to have_content(@tomato.name)
      expect(page).to have_content(@onion.name)
      expect(page).to have_content(@garlic.name) 
    end
  end

  describe 'User Story 3' do
    it 'displays the total cost of all the ingredients' do
      visit "/recipes/#{@spaghetti_bolognese.id}"

      expect(page).to have_content("Total Cost: 4")
    end
  end
end