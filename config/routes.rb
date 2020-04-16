Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "users/:id/trips", to: "users#trip", as: :users_trip

  resources :trips do
    resources :ketchups, only: [:create]
  end

  resources :ketchups, only: [:show, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
