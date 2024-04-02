require "rails_helper"

RSpec.describe Recipe, type: :model do
  before :each do
    @recipe_1 = Recipe.create!(name: 'Kakarot', complexity: 9001, genre: 'Dessert')
    @ingredient_1 = @recipe_1.ingredients.create!(name: "First Ingredient", cost: 50)
    @ingredient_2 = @recipe_1.ingredients.create!(name: "Second Ingredient", cost: 40)
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe '#total_ingredient_cost' do
    it 'returns the total cost of all ingredients' do
      expect(@recipe_1.total_ingredient_cost).to eq(90)
    end
  end
end