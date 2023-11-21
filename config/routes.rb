Rails.application.routes.draw do
  resources :bookings, only: [:edit, :update, :destroy, :new, :create]
end
