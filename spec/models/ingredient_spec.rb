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

   describe ".sort_alphabetically" do
      it 'sorts all ingredients alphabetically' do
         @ingredient_1 = Ingredient.create!(name: "First Ingredient", cost: 50)
         @ingredient_2 = Ingredient.create!(name: "Second Ingredient", cost: 40)
         @ingredient_3 = Ingredient.create!(name: "Fifth Ingredient", cost: 10)

         expect(Ingredient.sort_alphabetically).to eq([@ingredient_3, @ingredient_1, @ingredient_2])
      end
   end

end