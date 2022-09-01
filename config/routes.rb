Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/components', to: "pages#components"
  get '/food-choice', to: "pages#search_1"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: %i[index show] do
    resources :favorites, only: %i[create]
  end

  resources :lists

  resources :favorites, only: %i[index update destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
