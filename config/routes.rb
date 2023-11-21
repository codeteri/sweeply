Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :services
  resources :bookings, only: [:edit, :update, :destroy, :new, :create]

end
