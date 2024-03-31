require 'rails_helper'

RSpec.describe 'Recipes Show Page', type: :feature do
  describe ' USER STORY #2' do
    describe 'When I visit /recipes/:id' do
      before(:each) do
        @tacos = Recipe.create!(name: "Tacos", complexity: 2, genre: "Mexican")

        @beef = @tacos.ingredients.create!(name: "Ground Beef", cost: 7)
        @salt = @tacos.ingredients.create!(name: "Salt", cost: 1)
        @tortillas = @tacos.ingredients.create!(name: "tortillas", cost: 3)
        @salsa = @tacos.ingredients.create!(name: "salsa", cost: 2)
        @s_cream = @tacos.ingredients.create!(name: "Sour Cream", cost: 1)

        visit "/recipes/#{@tacos.id}"
      end

      it 'displays recipe name, ingredients and cost for meal' do
        expect(page).to have_content(@tacos.name)
        expect(page).to have_content(@tacos.complexity)
        expect(page).to have_content(@tacos.genre)
        expect(page).to have_content(@beef.name)
        expect(page).to have_content(@salt.name)
        expect(page).to have_content(@tortillas.name)
        expect(page).to have_content(@salsa.name)
        expect(page).to have_content(@s_cream.name)
      end
    end 
  end
end