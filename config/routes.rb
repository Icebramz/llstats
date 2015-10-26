Rails.application.routes.draw do

resources :teams do
  resources :players, shallow: true
end

root "teams#index"

end
