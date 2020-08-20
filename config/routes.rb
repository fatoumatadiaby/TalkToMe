Rails.application.routes.draw do
  get '/', to: 'sessions#welcome'
  
  get '/login', to: 'sessions#new' as "login"
  post '/login', to: 'sessions#create'
  
  get '/signup', to: 'users#new', as: "signup"
  post '/signup', to: 'users#create'
  
  
  delete '/logout', to: 'sessions#destroy' as: "logout"
  
  
  get '/auth/facebook/callback', to: 'sessions#create'

  resources :resources
  resources :posts
  resources :users, only: [] do
    "/users/:user_id"
  end

end
