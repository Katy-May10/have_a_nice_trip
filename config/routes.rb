Rails.application.routes.draw do
  devise_for :users
  root "itineraries#index"
  resources :itineraries, only: [:index, :new, :create, :show]
end
