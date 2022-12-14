Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/components', to: "pages#components"

  get '/food-choice', to: "pages#search_1"
  get '/food-choice-2', to: "pages#search_2"
  get '/food-choice-3', to: "pages#search_3"
  get '/food-choice-4', to: "pages#loading_results"

  get '/search', to: "pages#search"
  get '/confirmation/:id', to: "restaurants#confirmation", as: :confirmation
  resources :bookings, only: %i[index show]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: %i[index show] do
    resources :favorites, only: %i[create]
    resources :bookings, only: %i[create]
  end

  resources :lists

  resources :favorites, only: %i[index update destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
