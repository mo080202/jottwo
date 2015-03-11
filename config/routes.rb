Rails.application.routes.draw do
  root to: 'sessions#show'
  post '/' => 'sessions#create'
  resources :users
  resources :jots do
    member do
      post :like
      post :unlike
    end
  end
end
