Jointregistrydatabase::Application.routes.draw do
  devise_for :surgeons
  resources :patients

  devise_for :hospital_admins
  devise_for :super_admins
  root :to => "home#index", :controllers => {:registrations => "registrations"}
  resources :users

  match "surgeon/:id/approve_surgeon" => "users#approve_surgeons", :as => "surgeon_approve", via: [:post]
  match "hospital_admin/:id/approve_hospital_admin" => "users#approve_hospital_admins", :as => "hospital_admin_approve", via: [:post]
end