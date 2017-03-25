Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :delete]
  match '/signup', to: 'users#new',        via: 'get'
  match '/login',  to: 'sessions#new',     via: 'get'
  match '/logout', to: 'sessions#destroy', via: 'delete'

  root "static_pages#home"
end
