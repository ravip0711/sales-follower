Rails.application.routes.draw do
  get 'deals/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :users do
    resources :stores
  end

  resources :stores do
    resources :deals
  end

end
