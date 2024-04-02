require "rails_helper"

RSpec.describe "ingredients index page", type: :feature do
    
    # User Story 1
    it "ingredients index page lists name and cost" do
        ing_1 = Ingredient.create!(name: "Ground Beef", cost: 6)
        ing_2 = Ingredient.create!(name: "Onion", cost: 2)
        ing_3 = Ingredient.create!(name: "Red Bell Pepper", cost: 1)

        visit "/ingredients"
        #save_and_open_page

        expect(page).to have_content ("Ground Beef")
        expect(page).to have_content ("6")
        expect(page).to have_content ("Onion")
        expect(page).to have_content ("2")
        expect(page).to have_content ("Bell Pepper")
        expect(page).to have_content ("1")
    end
    
    # Extension 1
    describe "class methods" do
        it '#sort_alphebtically' do
            @ing_1 = Ingredient.create!(name: "Red Bell Pepper", cost: 1)        
            @ing_2 = Ingredient.create!(name: "Ground Beef", cost: 6)
            @ing_3 = Ingredient.create!(name: "Onion", cost: 2)

            visit "/ingredients"
            save_and_open_page

            expect(@ing_2.name).to appear_before(@ing_3.name)
            expect(@ing_3.name).to appear_before(@ing_1.name)
        end
    end
end