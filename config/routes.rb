Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  resources :itineraries do
    member do
      get :download, defaults: { format: :pdf }
    end
    resources :plans, only: [:create, :update, :destroy]
  end
  resources :lists do
    resources :spots, only: [:create, :update, :destroy]
  end
  resources :prepares, only: [:index, :create, :update, :destroy]
  resources :souvenirs, only: [:index, :create, :update, :destroy]
  resources :records
  get 'itineraries/download', to: 'itineraries#download'
end