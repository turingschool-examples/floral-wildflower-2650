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

  describe "class methods" do
    it "#cost" do
    @tacos = Recipe.create!(name: "Tacos", complexity: 2, genre: "Mexican")

    @beef = @tacos.ingredients.create!(name: "Ground Beef", cost: 7)
    @salt = @tacos.ingredients.create!(name: "Salt", cost: 1)
    @tortillas = @tacos.ingredients.create!(name: "tortillas", cost: 3)
    @salsa = @tacos.ingredients.create!(name: "salsa", cost: 2)
    @s_cream = @tacos.ingredients.create!(name: "Sour Cream", cost: 1)
      expect(@tacos.cost).to eq(14)
    end
  end
end