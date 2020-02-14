Rails.application.routes.draw do
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'create_account', to: 'users#new'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'users/users_account_list', to: 'users#show_users', as: 'show_users_account'
  post 'users/set_admin_permission/:id', to: 'users#set_admin_permission', as: 'set_admin_permission'
  post 'users/remove_admin_permission/:id', to: 'users#remove_admin_permission', as: 'remove_admin_permission'

  resource :sessions, only: [:new, :create, :destroy]
  resources :users #, only: [:new, :create, :update, :edit, :show_users]
  resources :articles do
    resources :comments
  end
  root 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
