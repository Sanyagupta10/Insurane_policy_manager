Rails.application.routes.draw do
get 'dash_board/admin'
  get 'dash_board/customer'
  get 'policies/select_company'
  get 'policies/select_plan'
  get 'policies/display'
  get 'policies/policy_email'
  get 'policies/maturing'
  get 'companies/companyShow'
  get 'sessions/new'
  get 'users/new'
  root 'welcome#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # get '/admin/policies', to: 'policies#index'
  # get '/admin/policies/new', to: 'policies#new'
  
  resources :users
  resources :companies
  resources :policytypes
  resources :comments
  resources :posts
  resources :policies
  


 
end
