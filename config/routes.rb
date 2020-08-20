Rails.application.routes.draw do
  # For details on the DSL avai(lable within this file, see https://guides.rubyonrails.org/routing.html
    devise_for :users

  root to: 'swimming_pools#index'

  resources :swimming_pools do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :edit, :update]
end
