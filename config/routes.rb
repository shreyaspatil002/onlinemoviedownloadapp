Rails.application.routes.draw do
  #resources :categories
  resources :products do
    resources :reviews
  end
  
  devise_for :users, controllers: {registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do 
    member do 
      get 'download_pdf'
    end 
  end
  root to: 'products#index'
 

end
