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
  # get '/customer/policies', to: 'policies#index'
  # get '/policies/new', to: 'policies#new'
  # post '/policies/new', to: 'policies#create'
  # get '/edit/policy', to: 'policies#edit'
  # post '/edit/policy', to: 'policies#update'
  # delete '/delete/policy', to: 'policies#destroy'
  
  
  resources :users
  resources :companies
  resources :policytypes
  resources :comments
  

  scope :admin do
    resources :policies
  end
end
