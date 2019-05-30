Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  post 'home/chart0'
  post 'home/chart1'


  resources :tours
  resources :clients

  get 'client/autocomplite', to: 'clients#autocomplite', as: 'clients_autocomplite'


  devise_for :users, :controllers => {registrations: "registrations"}

  root 'home#index'
end
