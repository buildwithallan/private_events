Rails.application.routes.draw do

  get 'home/index'
  devise_for :users
  resources :events

  resources :users
  resources :event_attendances
  root 'events#index'
end
