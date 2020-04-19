Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users, only: [:destroy] do
    resources :friend_requests, only: [:create]
  end

  resources :friend_requests, only: [:update, :destroy]

  root to: 'pages#home'

  get 'users/:id/trips', to: 'users#trip', as: :users_trip

  resources :trips do
    resources :ketchups, only: [:create]
  end

  resources :ketchups, only: [:show, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
