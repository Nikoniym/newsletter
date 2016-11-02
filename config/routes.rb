Rails.application.routes.draw do
  resources :users
  resources :positions

  get 'home/index'
  root to: 'home#index'
end
