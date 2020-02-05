Rails.application.routes.draw do
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'create_account', to: 'users#new'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get 'authorized', to: 'sessions#page_requires_login'
  
  resource :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :update, :edit]
  resources :articles do
    resources :comments
  end
  root 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
