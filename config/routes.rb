Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :users, only: [:edit, :update]
  resources :routines, only: [:create] do
    collection do
      delete 'destroy_all'
    end
  end
  resources :posts, only: [:index, :create]
  resources :favorites, only: [:new, :create]
  resources :todos, only: [:index, :create, :destroy]
end
