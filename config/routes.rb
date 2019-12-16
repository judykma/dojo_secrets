Rails.application.routes.draw do
  root "sessions#new"
  #ROUTE FOR CREATING A USER
  get "users/new" => "users#new"
  post "users" => "users#create"
  get "users/:id" => "users#show"
  post "users/:id" => "secrets#create"

  #ROUTE FOR LOGGING IN A USER
  get "sessions/new" => "sessions#new"
  post "sessions/new" => "sessions#create"
  delete "sessions" => "sessions#destroy"

  #ROUTES FOR SECRETS
  get "secrets" => "secrets#index"

  post "secrets" => "secrets#create"
  delete "secrets/:id" => "secrets#destroy"

  post "secrets/:id/like" => "likes#create"
  delete "secrets/:id/unlike" => "likes#destroy"
end
