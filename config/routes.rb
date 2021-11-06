# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Almost every application defines a route for the root path ("/") at the top of this file.
  root 'home#index'
  post '/search', to: 'home#search'
  get '/clear_message', to: 'home#clear_message'

  resources :posts do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[new create destroy]
  end

  get '/login', to: 'session#index', as: 'new_session'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy', as: 'destroy_session'

  get '/register', to: 'registration#index', as: 'new_registration'
  post '/register', to: 'registration#create'
end
