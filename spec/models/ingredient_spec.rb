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

   before(:each) do
      @ingredient_1 = Ingredient.create!(name: "Beef", cost: 40)
      @ingredient_2 = Ingredient.create!(name: "Chicken", cost: 20)  
   end

   describe "#sorted_alphabetically" do
      it "returns names in order" do
         expect(Ingredient.sorted_alphabetically).to eq([@ingredient_1, @ingredient_2])
      end
   end
end