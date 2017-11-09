Rails.application.routes.draw do
  resources :users
  resources :resources
  resources :brands
  resources :cars do
    resources :resources, only: [:show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#root'

end
