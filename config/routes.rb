Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  resources :itineraries, only: [:index, :new, :create, :show] do
    resources :plans, only: [:create, :update]
  end
end
