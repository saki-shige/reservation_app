Rails.application.routes.draw do

  # get 'users/account'
  # get 'users/profile'
  root 'home#index'

  devise_for :users
  get '/users/profile', to: 'users#profile'
  patch '/users/profile', to: 'users#update_profile'
  get '/users/account', to: 'users#account'

  get '/rooms/search', to: 'rooms#search'
  resources :rooms, except: [:edit, :update]

  resources :reservations, except: [:edit, :update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
