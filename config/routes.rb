Rails.application.routes.draw do
  root to: 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  
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