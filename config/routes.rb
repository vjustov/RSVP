Rails.application.routes.draw do
  devise_for :users
  root 'events#index'

  resources :events, only: [:index, :show] do
    resources :registrations, only: [:create]
  end

  resources :registrations, only: [:index]

  resources :event_registrations, only: [:index]

end
