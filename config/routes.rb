Rails.application.routes.draw do
  get 'users/new'
  root 'dash_board#home'
  get '/signup', to: 'users#new'
  resources :users
end
