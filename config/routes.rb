Rails.application.routes.draw do
  root to: 'sessions#show'
  post '/' => 'sessions#create'
  resources :users
  resources :jots
end
