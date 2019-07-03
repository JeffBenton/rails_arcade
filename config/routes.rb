Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :games, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update]
  resources :plays, only: [:show]
  root 'sessions#new'

  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  post '/play', to: 'plays#create'
end
