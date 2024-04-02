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

  describe ".instance methods" do
    describe ".total_cost" do
      it "calculates the total cost of ingredients for the recipe" do
        ingredient_1 = Ingredient.create!(name: "BBQ", cost: 2)
        ingredient_2 = Ingredient.create!(name: "Chicken", cost: 12)
        recipe_1 = Recipe.create!(name: "BBQ Chicken", complexity: 2, genre: "Soul food", ingredients: [ingredient_1, ingredient_2])

        expect(recipe_1.total_cost).to eq(14)
      end
    end
  end
end