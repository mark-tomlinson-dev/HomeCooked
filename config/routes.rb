Rails.application.routes.draw do
  get 'profiles/index'
  get 'profiles/show'
  get 'profiles/new'
  get 'profiles/edit'
  get 'profiles/create'
  get 'profiles/update'
  get 'profiles/destroy'
  devise_for :users
  get "/", to: "pages#index", as: "root"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
