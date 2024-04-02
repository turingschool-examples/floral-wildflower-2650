require 'rails_helper'

RSpec.describe 'recipes#show', type: :feature do
  before(:each) do
    @recipe_1 = Recipe.create!(name: "Rice", complexity: 1, genre: "Rice Genre")
    @ingredient_1 = @recipe_1.ingredients.create!(name: "Beef", cost: 40)
    @ingredient_2 = @recipe_1.ingredients.create!(name: "Chicken", cost: 20)
  end

  # User Story 2 - Recipes Show
  it "recipes attributes with each ingredient" do
    # As a visitor,
    # When I visit '/recipes/:id',
    visit "/recipes/#{@recipe_1.id}"
    # Then I see the recipe's name, complexity and genre,
    expect(page).to have_content(@recipe_1.name)
    expect(page).to have_content(@recipe_1.complexity)
    expect(page).to have_content(@recipe_1.genre)
    # and I see a list of the names of the ingredients for the recipe.
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
  end

  # User Story 3 - Total Cost
  it "" do
    # As a visitor,
    # When I visit '/recipes/:id'
    visit "/recipes/#{@recipe_1.id}"
    # I see the total cost of all of the ingredients in the recipe.
    expect(page).to have_content("Total cost: 60")
  end
end