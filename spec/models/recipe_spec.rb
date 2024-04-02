require "rails_helper"

RSpec.describe Recipe, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :complexity }
    it { should validate_presence_of :genre }
  end

  describe "relationships" do
    it { should have_many :recipe_ingredients }
    it { should have_many(:ingredients).through(:recipe_ingredients) }
  end

  before(:each) do
    @ground_beef = Ingredient.create!(
      name: "Ground Beef",
      cost: 5
    )

    @salt = Ingredient.create!(
      name: "Salt",
      cost: 1
    )

    @tomato_sauce = Ingredient.create!(
      name: "Tomato Sauce",
      cost: 3
    )

    @onion = Ingredient.create!(
      name: "Onion",
      cost: 1
    )

    @garlic = Ingredient.create!(
      name: "Garlic",
      cost: 1
    )

    @pasta = Ingredient.create!(
      name: "Pasta",
      cost: 6
    )

    @pasta_with_red_sauce = Recipe.create!(
      name: "Pasta with Red Sauce",
      complexity: 3,
      genre: "Dinner"
    )

    @ingredient_combos = [
      [@ground_beef.id, @pasta_with_red_sauce.id],
      [@salt.id, @pasta_with_red_sauce.id],
      [@tomato_sauce.id, @pasta_with_red_sauce.id],
      [@onion.id, @pasta_with_red_sauce.id],
      [@garlic.id, @pasta_with_red_sauce.id],
      [@pasta.id, @pasta_with_red_sauce.id]
    ]

    @ingredient_combos.each do |combo|
      RecipeIngredient.create!(
        ingredient_id: combo[0],
        recipe_id: combo[1]
      )
    end
  end

  it "can calculate total cost" do
    expect(@pasta_with_red_sauce.total_cost).to eq(17)
  end
end
