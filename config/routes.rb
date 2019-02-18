Rails.application.routes.draw do
  devise_for :users
  resource :users, only: [:show]
  resources :places
  root to: 'places#index'
end
