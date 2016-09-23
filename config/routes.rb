Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users

  root 'home#index'
  get 'admin', to: 'admins#dashboard'

  namespace :admin do
    resources :stores
    resources :deals
  end


  get 'deals/index'


  resources :users do
    resources :stores
  end

  resources :stores do
    resources :deals
  end

end
