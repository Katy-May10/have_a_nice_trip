Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  resources :itineraries do
    member do
      get :download, defaults: { format: :pdf }
    end
    resources :plans, only: [:create, :update, :delete]
  end
  resources :lists do
    resources :spots, only: [:create, :update, :delete]
  end
  resources :prepares, only: [:index, :create, :update, :delete]
  resources :souvenirs, only: [:index, :create, :update, :delete]
  resources :records
  get 'itineraries/download', to: 'itineraries#download'
end