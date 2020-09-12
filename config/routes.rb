Rails.application.routes.draw do
  
  get 'login', to: "sessions#new"
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: "users#new"
  post 'signup', to: "users#create"
  
  root to: "diaries#index"
  
  resources :diaries
  resources :users, only: [:new, :create]
  
end
