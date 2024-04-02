require 'rails_helper'

RSpec.describe 'ingredient index', type: :feature do
  before(:each) do
    @ingredient_1 = Ingredient.create!(name: "Beef", cost: 40)
    @ingredient_2 = Ingredient.create!(name: "Chicken", cost: 20)
  end

  # User Story 1 - Ingredients Index
  it "ingredients attributes" do
    # As a visitor,
    # When I visit '/ingredients'
    visit "/ingredients"
    # I see a list of all the ingredients including their name and cost
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_1.cost)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_2.cost)
  end

  # Extension 1 - Ingredients Sorted Alphabetically
  it "ingredients names sorted alphabetically" do
    # As a visitor,
    # When I visit '/ingredients',
    visit "/ingredients"
    # Then I see that the list of ingredients is sorted alphabetically by name
    expect(@ingredient_1.name).to appear_before(@ingredient_2.name)
    expect(@ingredient_2.name).to_not appear_before(@ingredient_1.name)
  end
end