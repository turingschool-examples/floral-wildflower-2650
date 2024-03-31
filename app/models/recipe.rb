class Recipe < ApplicationRecord
   validates_presence_of :name, :complexity, :genre

   has_many :recipe_ingredients, dependent: :destroy
   has_many :ingredients, through: :recipe_ingredients

   def cost
      ingredients.sum(:cost)
   end
end