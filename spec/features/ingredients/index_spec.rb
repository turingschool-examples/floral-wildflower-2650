require "rails_helper"

RSpec.describe "Ingerdients index" do
  

  describe '#us 1' do
    it 'sees all ingredients and cost' do

      ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      ingredient1 = Ingredient.create!(name: "Salt", cost: 4)

      visit "/ingredients"
      # When I visit '/ingredients'
      
      # I see a list of all the ingredients including their name and cost


      # (e.g. "Ground Beef: 2"
      # Salt: 4")
      expect(page).to have_content("Ground Beef: 2")
      expect(page).to have_content("Salt: 4")

    end
  end
end