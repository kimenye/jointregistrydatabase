Jointregistrydatabase::Application.routes.draw do
  devise_for :surgeons
  resources :patients

  devise_for :hospital_admins
  devise_for :super_admins
  root :to => "home#index", :controllers => {:registrations => "registrations"}
  resources :users

  match "user/:id/approve" => "users#approve", :as => "user_approve", via: [:post]
end