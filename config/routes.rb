Rails.application.routes.draw do

  get 'home/index'
  devise_for :users
  resources :events

  resources :users
   
  root 'events#index'
end
