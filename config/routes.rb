Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :spends
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "categories#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
