require 'rails_helper'

describe 'Recipes API' do
  context 'GET /api/v1/recipes/1' do
    it 'success' do
      # Arrange
      user = User.create!(email: 'testuser@email.com', password: '123456')
      recipe_type = RecipeType.create!(name: 'Bolos')
      recipe = Recipe.create!(title: 'Bolo de mulango', cook_time: 60, recipe_type_id: 1, ingredients: 'Farinha, ovo, açucar, morangos', instructions: 'Junte tudo e asse', user_id: user.id )
  
      # Act
      get "/api/v1/recipes/#{recipe.id}"
  
      # Assert
      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json' 
      json_response = JSON.parse(response.body)
      expect(json_response[0]["title"]).to eq("Bolo de mulango")
      expect(json_response[0]["cook_time"]).to eq(60)
      expect(json_response[0]["ingredients"]).to eq("Farinha, ovo, açucar, morangos")
      expect(json_response[0]["instructions"]).to eq("Junte tudo e asse")
      expect(json_response[1]["user_email"]).to eq("testuser@email.com")
      expect(json_response[0].keys).not_to include("created_at")
      expect(json_response[0].keys).not_to include("updated_at")
    end
  end
end