Rails.application.routes.draw do


  get 'home/index'
  devise_for :users


  resources :clients

  root 'clients#index'
end
