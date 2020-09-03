Rails.application.routes.draw do
  root to: 'sessions#welcome', as: 'home'
  
  get '/login', to: 'sessions#new', as: 'login'
  get '/auth/facebook/callback', to: 'sessions#create'
  post '/login', to: 'sessions#create'
  
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  
  
  delete '/logout', to: 'sessions#destroy'
  
 resources :posts do
    resources :comments
  end 

  resources :users do
     resources :posts
  end

  
  resources :users, only: [:new, :create]
  resources :resources, only: [:new, :index, :show]
  resources :post


end
