require "rails_helper"

RSpec.describe "Recipe Index Page", type: :feature do
  before :each do
    @beef_wellington = Recipe.create!(name: 'Beef Wellington', complexity: 9, genre: "French")
    @short_ribs = Recipe.create!(name: 'Braised Short Ribs', complexity: 5, genre: "Spanish")
    @tiramisu = Recipe.create!(name: 'Tiramisu', complexity: 10, genre: "Italian")

    @salt = @beef_wellington.ingredients.create!(name: 'Salt', cost: 5)
    @ground = @beef_wellington.ingredients.create!(name: 'Ground Beef', cost: 30)
    @pastry = @beef_wellington.ingredients.create!(name: 'Puff Pastry', cost: 20)

    @meat = @short_ribs.ingredients.create!(name: 'Short Ribs', cost: 50)
    @wine = @short_ribs.ingredients.create!(name: 'Red Wine', cost: 35)
    @onion = @short_ribs.ingredients.create!(name: 'White Onion', cost: 5)

    @coffee = @tiramisu.ingredients.create!(name: 'Coffee Grounds', cost: 15)
    @ice_cream = @tiramisu.ingredients.create!(name: 'Italian Ice Cream', cost: 20)
    @batter = @tiramisu.ingredients.create!(name: 'Cake Batter', cost: 17)
  end

  describe "Index" do
    it "shows recipes" do
      visit '/recipes'

      expect(page).to have_content("Beef Wellington")
    end
  end  
end