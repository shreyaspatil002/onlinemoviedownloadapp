# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :categories
  get 'cart', to: 'cart#show'
  get 'cart_pay', to: 'cart#pay'
  get 'all_cart', to: 'cart#index'
  post 'cart/add'
  post 'cart/remove'

  resources :cart
  resources :products do
    resources :reviews
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    member do
      get 'download_pdf'
    end
  end
  root to: 'products#index'
end
