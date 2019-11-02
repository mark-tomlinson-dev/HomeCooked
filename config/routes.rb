Rails.application.routes.draw do
  get 'listings/index'
  get 'listings/show'
  get 'listings/new'
  get 'listings/create'
  devise_for :users
  get "/", to: "pages#index", as: "root"
  
  # Profiles routes
  resources :profiles
  # Listings routes
  resources :listings
 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
