Rails.application.routes.draw do
  get 'policies/index'
  get 'policytypes/new'
  get 'policytypes/index'
  get 'dash_board/index'
  get 'dash_board/admin'
  get 'dash_board/customer'
  get 'policies/select_company'
  get 'policies/select_plan'
  get 'policies/display'
  get 'companies/index'
  get 'companies/companyShow'
  get 'sessions/new'
  get 'users/new'
  root 'welcome#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :companies
  resources :policytypes
  resources :policies
end
