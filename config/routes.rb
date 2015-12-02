Rails.application.routes.draw do

  devise_for :users
  get 'static_pages/home'

  get 'static_pages/help'

resources :games do
  resources :plays, shallow: true
end

resources :teams do
  resources :players, shallow: true
end

root "static_pages#home"

end
