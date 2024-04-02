require "./spec/rails_helper"

RSpec.describe "Recipes show page functionality" do
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

  it "displays the recipe's name, complexity and genre" do
    visit "/recipes/#{@pasta_with_red_sauce.id}"

    expect(page).to have_content(@pasta_with_red_sauce.name)
    expect(page).to have_content(
      "Complexity rating: #{@pasta_with_red_sauce.complexity}"
    )
    expect(page).to have_content("Genre: #{@pasta_with_red_sauce.genre}")
  end

  it "shows a list of the recipe's ingredients" do
    visit "/recipes/#{@pasta_with_red_sauce.id}"

    within ".ingredients-list" do
      expect(page).to have_content(@ground_beef.name)
      expect(page).to have_content(@salt.name)
      expect(page).to have_content(@tomato_sauce.name)
      expect(page).to have_content(@onion.name)
      expect(page).to have_content(@garlic.name)
      expect(page).to have_content(@pasta.name)
    end
  end

  it "shows the total cost of the ingredients for the recipe" do
    visit "/recipes/#{@pasta_with_red_sauce.id}"

    expect(page).to have_content("Total cost: $17.00")
  end
end
