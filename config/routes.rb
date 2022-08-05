Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'dash_board#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
end
