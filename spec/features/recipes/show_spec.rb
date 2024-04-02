require "rails_helper"

RSpec.describe "recipes show page", type: :feature do

    # User Story 2
    it "recipes show page lists name, complexity, and genre" do
        @recipe = Recipe.create!(name: "Ground Beef Stir Fry", complexity: 1, genre: "Asian")       
        @recipe.ingredients.create!(name: "Ground Beef", cost: 6)
        @recipe.ingredients.create!(name: "Onion", cost: 2)
        @recipe.ingredients.create!(name: "Red Bell Pepper", cost: 1)
        
        visit "/recipes/#{@recipe.id}"
        #save_and_open_page

        within "#recipe_info" do
            expect(page).to have_content ("#{@recipe.name}")        
            expect(page).to have_content ("#{@recipe.complexity}")
            expect(page).to have_content ("#{@recipe.genre}")
        end

        within "#recipe_ingredients" do
            expect(page).to have_content ("Ground Beef")
            expect(page).to have_content ("Onion")
            expect(page).to have_content ("Red Bell Pepper")
        end
    end

    # # User Story 3
    it "recipes show page lists total cost of recipe" do
        @recipe = Recipe.create!(name: "Ground Beef Stir Fry", complexity: 1, genre: "Asian")       
        @recipe.ingredients.create!(name: "Ground Beef", cost: 6)
        @recipe.ingredients.create!(name: "Onion", cost: 2)
        @recipe.ingredients.create!(name: "Red Bell Pepper", cost: 1)

        visit "/recipes/#{@recipe.id}"
        #save_and_open_page

        within "#recipe_info" do
            expect(page).to have_content ("$#{@recipe.total_cost}")
        end
    end

end