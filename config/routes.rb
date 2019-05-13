Rails.application.routes.draw do


  resources :tours
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'

  resources :clients


  devise_for :users, :controllers => {registrations: "registrations"}

  root 'clients#index'
end
