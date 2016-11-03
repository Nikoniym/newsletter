Rails.application.routes.draw do
  resources :users do
    post 'crop', :on => :member
  end
  resources :positions

  get 'home/index'
  root to: 'home#index'
end
