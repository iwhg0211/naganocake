Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: "hemes#top"
    resources :items
    get 'homes/about'
  end
  namespace :public do
    root to: "homes#top"
    resources :items
    get 'homes/about'
  end
end
