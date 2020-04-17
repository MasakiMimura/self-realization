Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users, only: [:edit, :update]
  get 'favorite', to: 'favorites#index'
  resources :posts, only: [:index, :create]
  resources :todos, only: [:index, :create, :destroy]
end
