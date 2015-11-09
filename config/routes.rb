Rails.application.routes.draw do

  get 'sessions/new'

  get 'static_pages/home'

  get 'static_pages/help'

  resources :teams do
    resources :players, shallow: true
  end

  root "static_pages#home"

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy' 
  resources :users

end
