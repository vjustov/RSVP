Rails.application.routes.draw do
  devise_for :users
  root 'events#index'

  resources :events, only: [:index, :show] do
    resources :registrations, only: [:create]
  end

  resources :registrations, only: [:index]

  namespace :admin do
    resources :registrations, only: [:index]
  end

end
