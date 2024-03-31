require "rails_helper"

RSpec.describe Ingredient, type: :model do

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "class methods" do
      it "#sorts ingredient names" do
         salt = Ingredient.create!(name: "Salt", cost: 1)
         beef = Ingredient.create!(name: "Ground Beef", cost: 7)
         tortillas = Ingredient.create!(name: "Tortillas", cost: 3)
         salsa = Ingredient.create!(name: "Salsa", cost: 2)
         sour_cream = Ingredient.create!(name: "Sour Cream", cost: 1)

         ingredients_sorted = Ingredient.sort_alph.pluck(:name)
         expect(ingredients_sorted).to eq(["Ground Beef", "Salsa", "Salt", "Sour Cream", "Tortillas"])         
      end
   end
end