require "rails_helper"

RSpec.describe "ingredients index page", type: :feature do
    
    # User Story 1
    it "ingredients index page lists name and cost" do
        @ing_1 = Ingredient.create!(name: "Ground Beef", cost: 6)
        @ing_2 = Ingredient.create!(name: "Onion", cost: 2)
        @ing_3 = Ingredient.create!(name: "Red Bell Pepper", cost: 1)

        visit "/ingredients"
        #save_and_open_page

        expect(page).to have_content (@ing_1.name)
        expect(page).to have_content (@ing_1.cost)
        expect(page).to have_content (@ing_2.name)
        expect(page).to have_content (@ing_2.cost)
        expect(page).to have_content (@ing_3.name)
        expect(page).to have_content (@ing_3.cost)
    end
    
    # Extension 1
    it 'lists ingredients in alphabetical order' do
        @ing_1 = Ingredient.create!(name: "Red Bell Pepper", cost: 1)        
        @ing_2 = Ingredient.create!(name: "Ground Beef", cost: 6)
        @ing_3 = Ingredient.create!(name: "Onion", cost: 2)

        visit "/ingredients"
        #save_and_open_page

        expect(@ing_2.name).to appear_before(@ing_3.name)
        expect(@ing_3.name).to appear_before(@ing_1.name)
    end

end