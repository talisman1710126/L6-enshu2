Rails.application.routes.draw do
  root "top#main"
  get "top/main"
  resources :products, only: [:index, :new, :create, :destroy]
  resources :cartitems, only: [:new, :create, :destroy]
  resources :carts, only: [:show]
end
