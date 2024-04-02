require 'rails_helper'

RSpec.describe "Recipes Show Page" do
  before(:each) do
    @ingredient_1 = Ingredient.create!(name: "BBQ", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Chicken", cost: 12)

    @recipe_1 = Recipe.create!(name: "BBQ Chicken", complexity: 2, genre: "Soul food", ingredients: [@ingredient_1, @ingredient_2])
    @recipe_2 = Recipe.create!(name: "Pasta", complexity: 1, genre: "Italian")
  end
  
  describe 'User Story 2' do
    it "I see the recipe and attributes" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content("BBQ Chicken")
      expect(page).to have_content("Complexity: 2")
      expect(page).to have_content("Genre: Soul food")

      expect(page).to_not have_content("Pasta")
      expect(page).to_not have_content("Complexity: 1")
      expect(page).to_not have_content("Genre: Italian")
    end
  end

  describe 'User Story 3' do
    it "Displays Total Cost" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content(14)
    end
  end
end