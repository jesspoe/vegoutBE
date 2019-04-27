Rails.application.routes.draw do
  
  resources :invites
  resources :groups
  resources :restaurants
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  post '/search', to: 'restaurants#search'
  get '/profile', to: 'users#profile'

end
