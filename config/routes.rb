Rails.application.routes.draw do
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