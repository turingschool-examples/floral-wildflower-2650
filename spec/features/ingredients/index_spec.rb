require 'rails_helper'

RSpec.describe 'Ingredients Index page', type: :feature do
  describe ' USER STORY 1' do
    describe 'As a visitor when I visit /ingredients' do
      before(:each) do
        @beef = Ingredient.create!(name: "Ground Beef", cost: 2)
        @salt = Ingredient.create!(name: "Salt", cost: 4)
        visit "/ingredients"
      end
      it 'displays ingredient names and their cost' do
        expect(page).to have_content(@beef.name)
        expect(page).to have_content(@beef.cost)
        expect(page).to have_content(@salt.name)
        expect(page).to have_content(@salt.cost)
      end
    end 
  end
end