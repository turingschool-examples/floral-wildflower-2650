require "rails_helper"

RSpec.describe "the recipes show" do
  before :each do
    @recipe_1 = Recipe.create!(name: 'Kakarot', complexity: 9001, genre: 'Dessert')
    @ingredient_1 = @recipe_1.ingredients.create!(name: "First Ingredient", cost: 50)
    @ingredient_2 = @recipe_1.ingredients.create!(name: "Second Ingredient", cost: 40)
  end

  it "lists all the ingredients including their name and cost" do
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_content('Kakarot')
    expect(page).to have_content(9001)
    expect(page).to have_content('Dessert')

    within ".recipe_ingredients" do
      expect(page).to have_content('First Ingredient')
      expect(page).to have_content('Second Ingredient')
    end
  end

  it 'lists the total cost of all of the ingredients in the recipe' do
    visit "/recipes/#{@recipe_1.id}"

    within ".recipe_ingredients" do
      expect(page).to have_content('Total Cost: 90')
    end
  end
end