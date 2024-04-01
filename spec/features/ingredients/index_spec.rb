require "rails_helper"

RSpec.describe "the ingredient index" do
  it "shows a list of all ingredients including their name and cost, sorted alphabetically by ingredient" do
    tomatoes = Ingredient.create!(name: "Tomatoes", cost: 4)
    spaghetti = Ingredient.create!(name: "Spaghetti", cost: 5)
    mushrooms = Ingredient.create!(name: "Mushrooms", cost: 3)
    ground_beef = Ingredient.create!(name: "Ground Beef", cost: 10)
    basil = Ingredient.create!(name: "Basil", cost: 1)
    
    visit "/ingredients"

    expect(page).to have_content("Basil: 1")
    expect(page).to have_content("Ground Beef: 10")
    expect(page).to have_content("Mushrooms: 3")
    expect(page).to have_content("Spaghetti: 5")
    expect(page).to have_content("Tomatoes: 4")

    expect(basil.name).to appear_before(ground_beef.name)
    expect(ground_beef.name).to appear_before(mushrooms.name)
    expect(mushrooms.name).to appear_before(spaghetti.name)
    expect(spaghetti.name).to appear_before(tomatoes.name)
  end
end