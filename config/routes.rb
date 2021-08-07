Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  root to:"items#index"
  resources :items
  resources :orders, only:[:index, :create]
end
