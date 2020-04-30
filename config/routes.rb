Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users, only: [:destroy] do
    resources :friend_requests, only: [:create]
    resources :chats, only: [:create]
  end

  resources :friend_requests, only: [:update, :destroy] do
    resources :friendships, only: [:create]
  end

  resources :notifications, only: [:index, :create, :show, :update] do
    collection do
      post :mark_as_read
    end
  end


  resources :friendships, only: [:destroy]

  root to: 'pages#home'

  get 'users/:id/notifications', to: 'users#notification', as: :user_notifications
  get 'users/:id/trips', to: 'users#trip', as: :user_trips
  get 'users/:id/friends', to: 'users#friend', as: :user_friends
  get 'users/:id/saves', to: 'users#save', as: :user_saves
  get 'users/:id/ketchups', to: 'users#ketchup', as: :user_ketchups

  resources :trips do
    resources :ketchups, only: [:create]
  end

  resources :ketchups, only: [:show, :update, :destroy]

  resources :chats, only: [:show] do
    resources :messages, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
