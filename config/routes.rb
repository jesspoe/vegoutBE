Rails.application.routes.draw do

  resources :votes
  resources :invites
  resources :groups
  resources :restaurants
  resources :users, only: [:create]

  post '/login', to: 'auth#create'
  get '/api', to: 'restaurants#api'
  post '/search', to: 'restaurants#search'
  post '/initial', to: 'restaurants#initial'
  get '/profile', to: 'users#profile'
  post '/addUserGroup', to: 'groups#addUserGroup'
  post '/getVotes', to: 'votes#getVotes'

  get 'location/:loc', to: 'location#location'
end
