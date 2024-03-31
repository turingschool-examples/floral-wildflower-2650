class Ingredient < ApplicationRecord
   validates_presence_of :name, :cost

   has_many :recipe_ingredients, dependent: :destroy
   has_many :recipes, through: :recipe_ingredients

   def self.sort_alph
      order(:name)
   end
end