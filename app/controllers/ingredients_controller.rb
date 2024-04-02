class IngredientsController < ApplicationController
    def index
        @all_ingredients = Ingredient.sort_alphabetically
    end
end