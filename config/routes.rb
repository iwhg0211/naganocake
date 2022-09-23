Rails.application.routes.draw do

  get 'homes/top'
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: "homes#top"
  
  namespace :admin do
    root to: "homes#top"
    resources :items
    resources :create_status, only: [:update]
    resources :orders, only: [:show,:update]
    resources :sessions, only: [:index,:show, :edit, :update]
    resources :order_details, only: [:update]
  end
  
  namespace :public do
    resources :items
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :customera, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
    get 'homes/about'
  end
  
end
