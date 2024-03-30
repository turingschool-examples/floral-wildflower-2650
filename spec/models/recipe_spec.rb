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

  describe '#total cost' do
    it 'Add up the ingredients total cost' do
      recipe1 = Recipe.create!(name: "Carne Asada", complexity: 3, genre: "Latin" )

      ingredient1 = recipe1.ingredients.create!(name: "Steak", cost: 10)
      ingredient2 = recipe1.ingredients.create!(name: "Salt", cost: 5)
      ingredient3 = recipe1.ingredients.create!(name: "Chile", cost: 2)
      ingredient4 = recipe1.ingredients.create!(name: "Onion", cost: 1)
      expect(recipe1.total_cost).to eq(18)
    end
  end
end