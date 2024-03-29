class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = Recipe.list_ingredients
    # @recipe_cost = Recipe.sum_ingredients
  end
end