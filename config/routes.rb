Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :games, only: [:index, :show, :new, :create, :edit, :update]
  resources :plays, only: [:show, :new, :create]
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update]
  root 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
end
