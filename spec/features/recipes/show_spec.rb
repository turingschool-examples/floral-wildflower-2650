require "rails_helper"

RSpec.describe "Recipe show page" do
  before(:each) do
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
  end
  describe 'US 2' do
    it 'lists the receipes attributes and names of ingredients for the recipe' do
      # User Story 2 - Recipes Show
      # As a visitor,
      # When I visit '/recipes/:id',
      visit "/recipes/#{@ez_ziti.id}"
      # Then I see the recipe's name, complexity and genre,
      expect(page).to have_content("EZ ziti!")
      expect(page).to have_content("Recipe complexity: 1")
      expect(page).to have_content("Recipe genre: Italian")
      # and I see a list of the names of the ingredients for the recipe.
      within '.ingredients' do
        expect(page).to have_content(@ingre_1.name)
        expect(page).to have_content(@ingre_2.name)
        expect(page).to have_content(@ingre_3.name)
        expect(page).to have_content(@ingre_4.name)
        expect(page).to_not have_content(@ingre_5.name)
      end
    end
  end

  describe "US 3" do
    it 'displays the total cost of recipe ingredients' do
      # User Story 3 - Total Cost
      # As a visitor,
      # When I visit '/recipes/:id'
      visit "/recipes/#{@ez_ziti.id}"
      # I see the total cost of all of the ingredients in the recipe.
      # (e.g. "Total Cost: 22")
      expect(page).to have_content("Total Cost: 19")
    end
  end
end