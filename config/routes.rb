Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins
  
  root to: "homes#top"
  get 'homes/about'
  resources :items
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :customera, only: [:show, :edit, :update, :unsubscribe, :withdraw]
  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    root to: "homes#top"
    resources :items
    resources :create_status, only: [:update]
    resources :orders, only: [:show,:update]
    resources :sessions, only: [:index,:show, :edit, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

end
