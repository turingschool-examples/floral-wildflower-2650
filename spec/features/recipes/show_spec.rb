require "rails_helper"

RSpec.describe "Recipe show" do
  

  describe '#us 2' do
    it 'shows a recipes ingredients' do
      recipe1 = Recipe.create!(name: "Carne Asada", complexity: 3, genre: "Latin" )

      ingredient1 = recipe1.ingredients.create!(name: "Steak", cost: 5)
      ingredient2 = recipe1.ingredients.create!(name: "Salt", cost: 4)
      # As a visitor,
      visit "/recipes/#{recipe1.id}"
      # When I visit '/recipes/:id',
      # Then I see the recipe's name, complexity and genre,
      # and I see a list of the names of the ingredients for the recipe.
      expect(page).to have_content("Recipe Name: Carne Asada")
      expect(page).to have_content("Complexity: 3")
      expect(page).to have_content("Genre: Latin")

      expect(page).to have_content("Steak: 5")
      expect(page).to have_content("Salt: 4")
      
    end
  end

  describe '#us 3 ' do
    it 'gets the total cost of the ingredients' do
      recipe1 = Recipe.create!(name: "Carne Asada", complexity: 3, genre: "Latin" )

      ingredient1 = recipe1.ingredients.create!(name: "Steak", cost: 5)
      ingredient2 = recipe1.ingredients.create!(name: "Salt", cost: 4)

      visit "/recipes/#{recipe1.id}"
        # When I visit '/recipes/:id'
        # I see the total cost of all of the ingredients in the recipe.
        # (e.g. "Total Cost: 22")
        save_and_open_page
      
      expect(page).to have_content("Total Cost: 9")
    end
  end
end