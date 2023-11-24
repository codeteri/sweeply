Rails.application.routes.draw do
  root to: "listings#index"
  devise_for :users
  resources :listings, :services
  resources :bookings, only: [:edit, :update, :destroy, :new, :create] do
    member do
      patch :accept
    end
  end
  get 'profile', to: 'pages#profile', as: 'profile'
  get 'profile/edit', to: 'pages#edit', as: 'edit_profile'
  patch 'profile', to: 'pages#update'
end
