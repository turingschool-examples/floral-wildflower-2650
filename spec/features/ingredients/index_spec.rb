require 'rails_helper'

RSpec.describe "Ingredients Index Page" do
  before(:each) do
    @ingredient_1 = Ingredient.create!(name: "BBQ", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Chicken", cost: 12)
  end
  
  describe 'User Story 1' do
    it "list of all the ingredients and attributes" do
      visit "/ingredients"

      expect(page).to have_content("BBQ")
      expect(page).to have_content("Chicken")
      expect(page).to have_content(2)
      expect(page).to have_content(12)
    end
  end
end