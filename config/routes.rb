Rails.application.routes.draw do

  root to: 'users#new'
  resources :favorites, only: [:index, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :reports
  resources :contacts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
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