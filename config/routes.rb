Rails.application.routes.draw do
  root 'events#index'

  resources :registrations, only: [:new, :create]
  resources :events, only: [:index]

  resources :event_registrations, only: [:index]

end
