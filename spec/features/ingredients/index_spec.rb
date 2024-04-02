require "./spec/rails_helper"

RSpec.describe "Ingredients index page functionality" do
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

    @cheddar_cheese = Ingredient.create!(
      name: "Cheddar Cheese",
      cost: 4
    )

    @hamburger_buns = Ingredient.create!(
      name: "Hamburger Buns",
      cost: 5
    )

    @eggs = Ingredient.create!(
      name: "Eggs",
      cost: 3
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

    @cheeseburger = Recipe.create!(
      name: "Cheeseburger",
      complexity: 1,
      genre: "Dinner"
    )

    @omelette = Recipe.create!(
      name: "Onion and Cheddar Omelette",
      complexity: 2,
      genre: "Breakfast"
    )

    @ingredient_combos = [
      [@ground_beef.id, @pasta_with_red_sauce.id],
      [@salt.id, @pasta_with_red_sauce.id],
      [@tomato_sauce.id, @pasta_with_red_sauce.id],
      [@onion.id, @pasta_with_red_sauce.id],
      [@garlic.id, @pasta_with_red_sauce.id],
      [@pasta.id, @pasta_with_red_sauce.id],
      [@ground_beef.id, @cheeseburger.id],
      [@cheddar_cheese.id, @cheeseburger.id],
      [@hamburger_buns.id, @cheeseburger.id],
      [@eggs.id, @omelette.id],
      [@onion.id, @omelette.id],
      [@salt.id, @omelette.id],
      [@cheddar_cheese.id, @omelette.id]
    ]

    @ingredient_combos.each do |combo|
      RecipeIngredient.create!(
        ingredient_id: combo[0],
        recipe_id: combo[1]
      )
    end
  end

  it "shows a list of all ingredients and their cost" do
    visit "/ingredients"

    expect(page).to have_content(@ground_beef.name)
    expect(page).to have_content("$#{@ground_beef.cost}.00")
    expect(page).to have_content(@salt.name)
    expect(page).to have_content("$#{@salt.cost}.00")
    expect(page).to have_content(@tomato_sauce.name)
    expect(page).to have_content("$#{@tomato_sauce.cost}.00")
    expect(page).to have_content(@onion.name)
    expect(page).to have_content("$#{@onion.cost}.00")
    expect(page).to have_content(@garlic.name)
    expect(page).to have_content("$#{@garlic.cost}.00")
    expect(page).to have_content(@cheddar_cheese.name)
    expect(page).to have_content("$#{@cheddar_cheese.cost}.00")
    expect(page).to have_content(@hamburger_buns.name)
    expect(page).to have_content("$#{@hamburger_buns.cost}.00")
    expect(page).to have_content(@eggs.name)
    expect(page).to have_content("$#{@eggs.cost}.00")
    expect(page).to have_content(@pasta.name)
    expect(page).to have_content("$#{@pasta.cost}.00")
  end
end
