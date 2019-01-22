Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  
  namespace :admin do
    resources :users, only: [:new, :create, :show]
  end
  
  resources :users

  resources :properties do
    collection do
      post :confirm
    end
  end
end