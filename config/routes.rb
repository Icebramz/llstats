Rails.application.routes.draw do

  get 'static_pages/home'

  get 'static_pages/help'

resources :teams do
  resources :players, shallow: true
end

root "static_pages#home"

end
