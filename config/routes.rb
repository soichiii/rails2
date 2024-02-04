Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :rooms do
    resources :reservations, only: [:index, :new, :create]
  end

  resources :reservations, only: [:index, :show, :destroy] do
    get 'confirmation', on: :member
    delete 'cancel', on: :member
  end

  resources :users, only: [:index, :show, :edit, :update] do
    get 'show_profile', on: :member
    get 'edit_profile', on: :member
    patch 'update_profile', on: :member
  end

  get 'my_reservations', to: 'reservations#my_reservations'
  get '/edit_account', to: 'registrations#edit_account', as: 'edit_account'
  
  authenticate :user do
    get '/user_account', to: 'users#show', as: :user_account
  end

  get '/search', to: 'rooms#search', as: 'search'

  resource :user, only: [:show_profile, :edit_profile, :update_profile], path: 'profile', controller: 'users'
  get 'profile', to: 'users#show_profile', as: 'user_profile'
  get 'edit_profile', to: 'users#edit_profile'
  patch 'update_profile', to: 'users#update_profile'

end
