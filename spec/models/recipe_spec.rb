require "rails_helper"

RSpec.describe Recipe, type: :model do
   
    describe "validations" do
        it {should validate_presence_of :name}
        it {should validate_presence_of :complexity}
        it {should validate_presence_of :genre}
    end

    describe "relationships" do
        it {should have_many :recipe_ingredients}
        it {should have_many(:ingredients).through(:recipe_ingredients)}
    end
  
    describe "instance_methods" do
        it '#total_cost' do
            @recipe = Recipe.create!(name: "Ground Beef Stir Fry", complexity: 1, genre: "Asian")       
            @recipe.ingredients.create!(name: "Ground Beef", cost: 6)
            @recipe.ingredients.create!(name: "Onion", cost: 2)
            @recipe.ingredients.create!(name: "Red Bell Pepper", cost: 1)

            expect(@recipe.total_cost).to eq(9)
        end
    end

end