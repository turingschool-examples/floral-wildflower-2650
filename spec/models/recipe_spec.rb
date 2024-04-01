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

  describe "instance methods" do
    it "can return the total cost of a recipe's ingredients" do
      spaghetti_with_meat_sauce = Recipe.create!(name: "Spaghetti with Meat Sauce", complexity: 3, genre: "Italian")
      spaghetti_with_meat_sauce.ingredients.create!(name: "Tomatoes", cost: 4)
      spaghetti_with_meat_sauce.ingredients.create!(name: "Spaghetti", cost: 5)
      spaghetti_with_meat_sauce.ingredients.create!(name: "Ground Beef", cost: 10)
      spaghetti_with_meat_sauce.ingredients.create!(name: "Basil", cost: 1)

      total_cost = spaghetti_with_meat_sauce.total_cost
      expect(total_cost).to eq 20
    end
  end
end