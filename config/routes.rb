Rails.application.routes.draw do
  devise_for :users
  resources :category_spends
  resources :categories
  resources :spends
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
