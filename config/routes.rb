Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'
  get 'password_resets/index'
  
  #get 'account_activations/edit'
  get 'static_pages/home'

  get 'sessions/new'

  root "static_pages#home"
  get 'static_pages/home'
  get 'static_pages/help'

  resources :games do
    resources :plays, shallow: true
  end

  resources :teams do
    resources :players, shallow: true
  end 

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy' 

  resources :users
#  resources :users do
#    resources :teams, shallow: true
#      resources :players, shallow: true
#    end
  #end

  resources :account_activations, only: [:edit] #named route for edit action
  resources :password_resets,     only: [:new, :create, :edit, :update, :index]

end
