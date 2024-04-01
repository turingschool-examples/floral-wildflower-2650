require "rails_helper"

RSpec.describe "the recipe show page" do
  it "shows the recipe's name, complexity and genre, as well as the ingredients and total cost for the recipe" do
    spaghetti_with_meat_sauce = Recipe.create!(name: "Spaghetti with Meat Sauce", complexity: 3, genre: "Italian")
    spaghetti_with_meat_sauce.ingredients.create!(name: "Tomatoes", cost: 4)
    spaghetti_with_meat_sauce.ingredients.create!(name: "Spaghetti", cost: 5)
    spaghetti_with_meat_sauce.ingredients.create!(name: "Ground Beef", cost: 10)
    spaghetti_with_meat_sauce.ingredients.create!(name: "Basil", cost: 1)

    spaghetti_with_butter = Recipe.create!(name: "Spaghetti with Butter", complexity: 1, genre: "Lazy")
    spaghetti_with_butter.ingredients.create!(name: "Spaghetti", cost: 5)
    spaghetti_with_butter.ingredients.create!(name: "Butter", cost: 3)
    spaghetti_with_butter.ingredients.create!(name: "Basil", cost: 1)

    visit "/recipes/#{spaghetti_with_meat_sauce.id}"

    expect(page).to have_content("Spaghetti with Meat Sauce")
    expect(page).to have_content("Complexity: 3")
    expect(page).to have_content("Genre: Italian")
    expect(page).to have_content("Ingredients")
    expect(page).to have_content("Spaghetti")
    expect(page).to have_content("Tomatoes")
    expect(page).to have_content("Beef")
    expect(page).to have_content("Basil")
    expect(page).to have_content("Total Cost: $20")

    expect(page).to_not have_content("Butter")
  end
end


# User Story 3 - Total Cost

# As a visitor,
# When I visit '/recipes/:id'
# I see the total cost of all of the ingredients in the recipe.
# (e.g. "Total Cost: 22")

