Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'

  resources :tours
  resources :clients

  get 'client/autocomplite', to: 'clients#autocomplite', as: 'clients_autocomplite'


  devise_for :users, :controllers => {registrations: "registrations"}

  root 'home#index'
end
