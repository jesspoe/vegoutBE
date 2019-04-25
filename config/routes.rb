Rails.application.routes.draw do
  
  resources :restaurants
  resources :users, only: [:create]
  post '/login', to: 'auth#create'

end
