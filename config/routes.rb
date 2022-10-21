Rails.application.routes.draw do


devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'cart_items_destroy_all'
    post 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
    get 'orders/complete' => 'orders#complete', as: 'orders_complete'

    resources :items
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :customers, only: [:show, :edit, :update]
  end
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