require "rails_helper"

RSpec.describe Recipe, type: :model do
  before :each do
    @spaghetti_bolognese = Recipe.create!(name: "Spaghetti Bolognese", complexity: 3, genre: "Italian")

    @tomato = Ingredient.create!(name: "Tomato", cost: 2)
    @onion = Ingredient.create!(name: "Onion", cost: 1)
    @garlic = Ingredient.create!(name: "Garlic", cost: 1)

    RecipeIngredient.create!(recipe: @spaghetti_bolognese, ingredient: @tomato)
    RecipeIngredient.create!(recipe: @spaghetti_bolognese, ingredient: @onion)
    RecipeIngredient.create!(recipe: @spaghetti_bolognese, ingredient: @garlic)
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

  it '#total_cost' do
    expect(@spaghetti_bolognese.total_cost).to eq 4
  end
end