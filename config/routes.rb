Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  resources :itineraries, only: [:index, :new, :create, :show] do
    resources :plans, only: [:create, :update]
  end
  resources :itineraries do
    member do
      get :download
    end
  end
  resources :lists, only: [:index, :new, :create, :show] do
    resources :spots, only: [:create]
  end
  resources :prepares, only: [:index, :create]
  resources :souvenirs, only: [:index, :create]
  resources :records, only: [:index, :new, :create, :show]
  get 'itineraries/download', to: 'itineraries#download'
end