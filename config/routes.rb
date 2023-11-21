Rails.application.routes.draw do

  root to: "pages#home"

  resources :listings
  
  resources :users do
    resources :bookings, only: [:edit, :update, :destroy, :new, :create]
  end

end
