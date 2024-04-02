class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all.sort_alphabetically
  end
end