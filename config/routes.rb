OtoWebFront::Application.routes.draw do

  ## Registration and Authentication
   
  get 'signup', to: 'users#new',        as: 'signup'
  get 'login',  to: 'sessions#new',     as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  ## Site Navigation
  root to: 'home#index'

  get 'workstation/dashboard', as: 'dashboard' 


  ## Resources
  resources :users
  resources :sessions
  resources :password_resets

end
