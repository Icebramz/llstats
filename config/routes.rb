Rails.application.routes.draw do

  devise_for :users
  get 'static_pages/home'

  get 'static_pages/help'

resources :games

resources :teams do
  resources :players, shallow: true
end

root "static_pages#home"

end
