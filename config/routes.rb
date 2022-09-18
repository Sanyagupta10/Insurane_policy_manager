Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'dash_board/admin'
  get 'dash_board/customer'
  get 'policies/select_company'
  get 'policies/select_plan'
  get 'policies/display'
  get 'policies/policy_email'
  get 'policies/maturing'
  get 'companies/company_show'
  get 'sessions/new'
  root 'welcome#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post 'user/policies/new', to: 'policies#create'

  resources  :users
  resources :password_resets, only: [:new, :create, :edit, :update]
  scope '/user' do
    resources :companies, :policytypes, :comments, :policies
  end
end
