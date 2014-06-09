Jointregistrydatabase::Application.routes.draw do
  devise_for :users
  resources :surgeries

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :surgeons
  resources :patients

  devise_for :hospital_admins
  devise_for :super_admins
  root :to => "home#index", :controllers => {:registrations => "registrations"}
  resources :users

  match "user/:id/approve_user" => "users#approve_users", :as => "user_approve", via: [:post, :get]
  match "user/:id/" => "users#show", :as => "user_show", via: [:get]

  get "/about" => "home#about"
  get "/get_sizes" => "surgeries#get_sizes"
end