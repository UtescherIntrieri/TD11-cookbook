Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :recipe_types, only: %i[new create index show]
  resources :recipes, only: %i[new create edit update show]



  namespace :api do
    namespace :v1 do
      resources :recipes, only: %i[show]
    end
  end
end
