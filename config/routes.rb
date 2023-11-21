Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :listings
  resources :services
  resources :bookings, only: [:edit, :update, :destroy, :new, :create]
end
