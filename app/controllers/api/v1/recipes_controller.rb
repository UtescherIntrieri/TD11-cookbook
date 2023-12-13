class Api::V1::RecipesController < ApplicationController
  def show
    recipe = Recipe.find(params[:id])
    user = User.where(id: recipe.user_id)
    user_email = user[0]["email"]
    @final_view = [recipe, "user_email" => user_email]

    render status: 200, json: @final_view.as_json(except: [:id, :recipe_type_id, :created_at, :updated_at, :user_id, :role])
  end
end
