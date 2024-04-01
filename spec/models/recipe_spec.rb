require "rails_helper"

RSpec.describe Recipe, type: :model do
  before(:each) do
    @ingre_1 = Ingredient.create!(name: "salt", cost: 1)
    @ingre_2 = Ingredient.create!(name: "ziti", cost: 5)
    @ingre_3 = Ingredient.create!(name: "tomato", cost: 3)
    @ingre_4 = Ingredient.create!(name: "olive oil", cost: 10)
    @ingre_5 = Ingredient.create!(name: "water", cost: 0)

    @ez_ziti = Recipe.create!(name: "EZ ziti", complexity: 1, genre: "Italian")

    @ez_ziti_ingres_1 = RecipeIngredient.create!(ingredient_id: @ingre_1.id, recipe_id: @ez_ziti.id)
    @ez_ziti_ingres_2 = RecipeIngredient.create!(ingredient_id: @ingre_2.id, recipe_id: @ez_ziti.id)
    @ez_ziti_ingres_3 = RecipeIngredient.create!(ingredient_id: @ingre_3.id, recipe_id: @ez_ziti.id)
    @ez_ziti_ingres_4 = RecipeIngredient.create!(ingredient_id: @ingre_4.id, recipe_id: @ez_ziti.id)
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

  describe "instance methods" do
    describe "#total_cost" do
      it "sums the total cost of all ingredients for a specific recipe" do
        expect(@ez_ziti.total_cost).to eq(19)
      end
    end
  end
end