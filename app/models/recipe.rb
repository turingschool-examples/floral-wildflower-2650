class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates_presence_of :name, :complexity, :genre

  def self.list_ingredients
    Ingredient.where("#{recipe.id}" = )
  end

  # def self.sum_ingredients
  #   Recipe.ingredient.sum(:cost)
  # end
end