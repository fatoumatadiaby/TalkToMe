Rails.application.routes.draw do
  get '/', to: 'sessions#welcome'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  
  delete '/logout', to: 'sessions#destroy'
  
  
  get '/auth/facebook/callback', to: 'sessions#create'

  resources :resources
  resources :posts
  resources :users

end
