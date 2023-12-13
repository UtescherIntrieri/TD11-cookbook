class Api::V1::RecipesController < ApplicationController
  def show
    recipe = Recipe.find(params[:id])
    render status: 200, json: recipe.as_json
  end
end
