Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :customers do
    post 'crop', :on => :member
  end
  resources :positions

  get 'home/index'
  root to: 'home#index'
end
