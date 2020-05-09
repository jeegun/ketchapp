Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :users, only: [:destroy] do
    resources :connect_requests, only: [:create]
    resources :chats, only: [:create]
  end

  resources :connect_requests, only: [:update, :destroy] do
    resources :connections, only: [:create]
  end

  resources :notifications, only: [:index, :create, :show, :update]
  # do
  #   collection do
  #     post :mark_as_read
  #   end
  # end


  resources :connections, only: [:destroy]

  root to: 'pages#home'

  get 'users/:id/notifications', to: 'users#notification', as: :user_notifications
  get 'users/:id/trips', to: 'users#trip', as: :user_trips
  get 'users/:id/connections', to: 'users#connection', as: :user_connections
  get 'users/:id/saves', to: 'users#save', as: :user_saves
  get 'users/:id/ketchups', to: 'users#ketchup', as: :user_ketchups

  resources :trips do
    resources :ketchups, only: [:create]
  end

  resources :ketchups, only: [:show, :update, :edit, :destroy]

  resources :chats, only: [:show] do
    resources :messages, only: [:create]
  end

  resources :contacts, only: [:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
