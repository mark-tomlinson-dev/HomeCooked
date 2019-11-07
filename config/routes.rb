Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  get "/", to: "pages#index", as: "root"
  get "/payments/success", to: "payments#success"
  
  # Profiles routes
  resources :profiles
  # Listings routes
  resources :listings
  # Bookings routes
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
