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

  before(:each) do
    @recipe_1 = Recipe.create!(name: "Rice", complexity: 1, genre: "Rice Genre")
    @ingredient_1 = @recipe_1.ingredients.create!(name: "Beef", cost: 40)
    @ingredient_2 = @recipe_1.ingredients.create!(name: "Chicken", cost: 20)
  end
  describe "#total_cost" do
    it "give the total cost" do
      expect(@recipe_1.total_cost).to eq(60)
    end
  end
end