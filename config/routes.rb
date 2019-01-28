Rails.application.routes.draw do
  get 'reports/index'

  root to: 'users#new'
  resources :favorites, only: [:index, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :reports, only: [:new, :index, :create, :destroy]
  
  namespace :admin do
    resources :users
  end
  
  resources :users
  
  namespace :admin do
    resources :properties do
      collection do
        post :confirm
      end
    end
  end
  
  resources :properties
end