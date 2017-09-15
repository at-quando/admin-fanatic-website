Rails.application.routes.draw do
  resources :admins
  resources :users
  resources :shops
  resources :sessions
  resources :assistants
  resources :products
  resources :properties
  resources :brands
  resources :orders
  resources :order_items
  post 'get_brand' => 'products#getBrand'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
