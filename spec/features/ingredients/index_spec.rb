require "rails_helper"

RSpec.describe "the ingredients index" do
  before :each do
    @ingredient_1 = Ingredient.create!(name: "First Ingredient", cost: 50)
    @ingredient_2 = Ingredient.create!(name: "Second Ingredient", cost: 40)
  end
  it "lists all the ingredients including their name and cost" do
    visit '/ingredients'

    within "#ingredient_#{@ingredient_1.id}_info" do
      expect(page).to have_content('First Ingredient: 50')
    end

    within "#ingredient_#{@ingredient_2.id}_info" do
      expect(page).to have_content('Second Ingredient: 40')
    end
  end
end