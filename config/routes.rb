class LoggedInConstraint < Struct.new(:value)
  def matches?(request)
    request.session.key?('current_user_id') == value
  end
end

Rails.application.routes.draw do
   
   root 'sessions#new', as: :user_root, constraints: LoggedInConstraint.new(false)
   root 'users#new', constraints: LoggedInConstraint.new(true)
  
  
  resources :favorites, only: [:index, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :reports
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  namespace :admin do
    resources :users, only: [:new, :create, :show, :edit, :update]
  end
  
  namespace :admin do
    resources :reports, only: [:index, :destroy, :edit, :update]
  end
  
  
  resources :users, only: [:new, :create, :show, :edit, :update]
  
  namespace :admin do
    resources :properties do
      collection do
        post :confirm
      end
    end
  end
  
  
  resources :properties do
    get :city, on: :member
    resources :contacts, only: [:new, :create, :show]
  end
end