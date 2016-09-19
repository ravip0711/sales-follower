Rails.application.routes.draw do
  
  get 'admins/dashboard'

  devise_for :admins
  devise_for :users

  root 'home#index'
  get 'admin', to: 'admins#dashboard'
  get 'deals/index'


  resources :users do
    resources :stores
  end

  resources :stores do
    resources :deals
  end

end
