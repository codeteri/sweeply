Rails.application.routes.draw do
  root to: "listings#index"
  devise_for :users
  resources :listings, :services
  resources :bookings, only: [:edit, :update, :destroy, :new, :create]
  get '/profile/:id', to: 'pages#profile', as: 'profile'
end
