Rails.application.routes.draw do

  resources :users do
    resources :user_cars, only: [:new, :create]
  end

  get '/cars/just_added', to: 'cars#just_added', as: 'cars_just_added'
  get '/resources/just_added', to: 'resources#just_added', as: 'resources_just_added'
  get 'users/:user_id/user_cars/:id', to: 'user_cars#show'
  get 'users/:id/user_cars', to: 'user_cars#index'

  resources :resources
  resources :brands do
    resources :cars
  end
  resources :cars do
    resources :resources, only: [:show, :index, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#root'


  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  post 'sign_in', to: 'sessions#create'
  get 'sign_up', to: 'users#new', as: 'sign_up'
  post 'sign_up', to: 'users#create'

  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  get '/auth/google_oauth2/callback', to: "sessions#create_from_omniauth"
end
