Rails.application.routes.draw do
  get 'products/index'
  get 'categories/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'categories#index'

  resources :categories do
  	resources :products, only: [:index]
  end
  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
end
