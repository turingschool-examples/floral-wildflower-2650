require 'rails_helper'

RSpec.describe "Recipes Show Page" do
  before(:each) do
    @recipe_1 = Recipe.create!(name: "BBQ Chicken", complexity: 2, genre: "Soul food")
    @recipe_2 = Recipe.create!(name: "Pasta", complexity: 1, genre: "Italian")
  end
  
  describe 'User Story 2' do
    it "I see the recipe and attributes" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content("BBQ Chicken")
      expect(page).to have_content("2")
      expect(page).to have_content("Soul food")

      expect(page).to_not have_content("Pasta")
      expect(page).to_not have_content("1")
      expect(page).to_not have_content("Italian")
    end
  end
end