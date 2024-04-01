require "rails_helper"

RSpec.describe "the recipe show page" do
  it "shows the recipe's name, complexity and genre and the ingredients for the recipe" do
    tomatoes = Ingredient.create!(name: "Tomatoes", cost: 4)
    spaghetti = Ingredient.create!(name: "Spaghetti", cost: 5)
    beef = Ingredient.create!(name: "Ground Beef", cost: 10)
    basil = Ingredient.create!(name: "Basil", cost: 1)
    butter = Ingredient.create!(name: "butter", cost: 3)

    spaghetti_with_meat_sauce = Recipe.create!(name: "Spaghetti with Meat Sauce", complexity: 3, genre: "Italian")
    spaghetti_with_butter = Recipe.create!(name: "Spaghetti with Butter", complexity: 1, genre: "Lazy")

    visit "/recipes/#{spaghetti_with_meat_sauce.id}"

    expect(page).to have_content("Spaghetti with Meat Sauce")
    expect(page).to have_content("Complexity: 3")
    expect(page).to have_content("Genre: Italian")
    expect(page).to have_content("Ingredients")
    expect(page).to have_content("Spaghetti")
    expect(page).to have_content("Tomatoes")
    expect(page).to have_content("Beef")
    expect(page).to have_content("Basil")

    expect(page).to_not have_content("Butter")
  end
end


# User Story 2 - Recipes Show

# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.

