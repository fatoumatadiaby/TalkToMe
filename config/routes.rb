Rails.application.routes.draw do
  root to: 'sessions#welcome'
  
  get '/login', to: 'sessions#new'
  get '/auth/facebook/callback', to: 'sessions#create'
  post '/login', to: 'sessions#create'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  
  delete '/logout', to: 'sessions#destroy'
  
  


  resources :resources, only: [:index, :show]
  resources :posts
  resources :users, only: [:index, :new, :show]
  resources :sessions

end
