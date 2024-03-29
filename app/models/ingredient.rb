class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
   validates_presence_of :name, :cost

   def self.cost_total
    @total = self.where(recipe: recipe_id).sum(:cost)
   end
end