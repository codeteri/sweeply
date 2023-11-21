Rails.application.routes.draw do
  resources :users do
    resources :services
    resources :bookings, only: [:edit, :update, :destroy, :new, :create]
  end
end
