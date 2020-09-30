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

  
  resources :users, only: [:new, :create] do
     resources :posts 
     resources :resources
  end

#   resources :users do
   
#  end
 
#  resources :resources do
#   resources :posts
# end
  
  resources :comments
  resources :resources
  # resources :posts


end
